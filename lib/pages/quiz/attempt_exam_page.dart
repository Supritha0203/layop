import 'dart:async';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:layop2/pages/quiz/fill_in_blanks_widget.dart';
import 'package:layop2/pages/quiz/final_answers_reveal_page.dart';
import 'package:layop2/pages/quiz/json_question_parser.dart';
import 'package:layop2/pages/quiz/multiple_choice_question_widget.dart';
import 'package:layop2/pages/quiz/multiple_choice_question_widget_two.dart';
import 'package:layop2/pages/quiz/true_false_widget.dart';

class AttemptExamPage extends StatefulWidget {
  static const routeName = '/signin-signup/upcommingexam/exam/attempt';

  final String data;
  final int time;
  final String id;

  const AttemptExamPage(
      {super.key, required this.data, required this.time, required this.id});

  @override
  _AttemptExamPageState createState() => _AttemptExamPageState();
}

class _AttemptExamPageState extends State<AttemptExamPage>
    with TickerProviderStateMixin {
  bool _exit = false;

  late Timer _timer;

  int duration = (15 * 60);

  String seconds = '00', minutes = '00', hours = '00';

  void addHistoryOfStudent(
      {required String data, required List<dynamic> selectedItems}) async {
    try {
      final email = FirebaseAuth.instance.currentUser!.email;
      await FirebaseFirestore.instance
          .collection('student')
          .doc(email)
          .collection('history')
          .doc(widget.id)
          .set({
        'assessment': widget.data,
        'time': DateTime.now().toString(),
        'score': 0,
        'total': 0,
        'id': widget.id,
        'selectedItems': selectedItems,
      });
    } catch (e) {
      print(e);
    }
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (duration < 1) {
            timer.cancel();

            Navigator.popAndPushNamed(context, FinalAnswersRevelaPage.routeName,
                arguments: {
                  'answers': selectedItems,
                  'data': json,
                  'id': widget.id,
                });
          } else {
            duration = duration - 1;
            if (duration > 60) {
              int min = (duration / 60).truncate();
              if (min > 60) {
                int hr = (min / 60).truncate();
                min = min - hr * 60;
                int sec = duration - (min * 60 + hr * 60 * 60);
                if (hr < 10) {
                  hours = '0$hr';
                } else {
                  hours = '$hr';
                }

                if (min < 10) {
                  minutes = '0$min';
                } else {
                  minutes = '$min';
                }

                if (sec < 10) {
                  seconds = '0$sec';
                } else {
                  seconds = '$sec';
                }
              } else {
                int sec = duration - (min * 60);
                if (min < 10) {
                  minutes = '0$min';
                } else {
                  minutes = '$min';
                }

                if (sec < 10) {
                  seconds = '0$sec';
                } else {
                  seconds = '$sec';
                }
                hours = '00';
              }
            } else {
              if (duration < 10) {
                seconds = '0$duration';
              } else {
                seconds = '$duration';
              }
              minutes = '00';
              hours = '00';
            }
          }
        },
      ),
    );
  }

  Future<bool> showBackExitDilog({bool fromBackButton = true}) async {
    return await showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text(fromBackButton ? 'Exit' : 'End the exam?'),
            // backgroundColor: Colors.blueGrey[100],
            content: Container(
              height: 200,
              width: 300,
              child: Center(
                child: Text(fromBackButton
                    ? 'Do you want to exit from exam.\nYou can come back and attempt before time runs out.'
                    : 'Do you want to finish the exam and submit your answers.'),
              ),
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all<Size>(
                    const Size.fromWidth(100),
                  ),
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                ),
                child: const Text(
                  'Cancel',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  if (fromBackButton) {
                    setState(() {
                      _exit = true;
                    });
                    Navigator.pop(context);
                  } else {
                    _timer.cancel();

                    // dispose();
                    Navigator.pop(context);
                    Navigator.popAndPushNamed(
                        context, FinalAnswersRevelaPage.routeName,
                        arguments: {
                          'answers': selectedItems,
                          'data': json,
                          'id': widget.id,
                        });
                  }
                },
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all<Size>(
                    const Size.fromWidth(100),
                  ),
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                ),
                child: Text(
                  fromBackButton ? 'Exit' : 'End exam',
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          );
        });
  }

  late int totalLen;
  int totalAnswerd = 0;
  late JsonQuestionParser json;
  List<dynamic> selectedItems = [];

  late TabController _tabController;
  void setupQuestionsAndStartTimer() {
    json = JsonQuestionParser.fromJson(jsonDecode(widget.data));

    _tabController = TabController(length: json.questions.length, vsync: this);
    totalLen = json.questions.length;
    List.generate(totalLen, (index) {
      if (json.questions[index].type == 1) {
        final n = List.generate(
            json.questions[index].answers.length, (i) => -1234567890123411123);
        selectedItems.add(n);
      } else {
        selectedItems.add(-1234567890123411123);
      }
    });
    startTimer();
  }

  @override
  void initState() {
    setupQuestionsAndStartTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void noOfAnswerd() {
    int count = 0;

    selectedItems.forEach((element) {
      if (element is List) {
        final b = element.any((e) => e != -1234567890123411123);
        if (b) {
          count++;
        }
      } else if (element is String) {
        count++;
      } else {
        if (element != -1234567890123411123) {
          count++;
        }
      }
    });
    setState(() {
      totalAnswerd = count;
    });
  }

  void selectRadioTile(int val, int index) {
    setState(() {
      selectedItems[index] = val;
    });
    noOfAnswerd();
  }

  void selectTrueFalse(int val, int index) {
    setState(() {
      selectedItems[index] = val;
    });
    noOfAnswerd();
  }

  void selectedCheckBoxes(int val, int index, int anotherIndex) {
    if (anotherIndex == -1) {
      setState(() {
        selectedItems[index][val] = val;
      });
    } else {
      setState(() {
        selectedItems[index][anotherIndex] = val;
      });
    }

    noOfAnswerd();
  }

  void submittedFillInBlanksAnswer(int index, dynamic val) {
    setState(() {
      selectedItems[index] = val;
    });
    noOfAnswerd();
    print(selectedItems);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        await showBackExitDilog();
        return _exit;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Time left - $hours:$minutes:$seconds',
            style: TextStyle(
              color: duration > (5 * 60) ? Colors.black : Colors.red,
              fontSize: 16,
            ),
          ),
          actions: [
            Text('10'),
          ],
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: Colors.black,
            labelStyle: TextStyle(
              color: Colors.black,
            ),
            labelColor: Colors.black,
            controller: _tabController,
            tabs: List.generate(
                totalLen,
                (index) => Container(
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Tab(
                            text: '${index + 1}',
                          ),
                          // if (selectedItems[index] != -1234567890123411123)
                          (selectedItems[index] is List)
                              ? (selectedItems[index]
                                      .any((e) => e != -1234567890123411123))
                                  ? Positioned(
                                      child: Text(
                                        'A',
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    )
                                  : Container()
                              : (selectedItems[index] != -1234567890123411123)
                                  ? Positioned(
                                      child: Text(
                                        'A',
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    )
                                  : Container(),
                        ],
                      ),
                    )).toList(),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: List.generate(totalLen, (index) {
            if (json.questions[index].type == 0) {
              return multipleChoiceQuestionWidget(
                question: json.questions[index],
                function: selectRadioTile,
                index: index,
                selectedVal: selectedItems[index],
              );
            }
            if (json.questions[index].type == 1) {
              return multipleChoiceQuestionTwoWidget(
                question: json.questions[index],
                function: selectedCheckBoxes,
                index: index,
                selectedVal: selectedItems[index],
              );
            }
            if (json.questions[index].type == 2) {
              return trueFalseWidget(
                question: json.questions[index],
                function: selectTrueFalse,
                index: index,
                selectedVal: selectedItems[index],
              );
            }
            return FillInBlanks(
              question: json.questions[index],
              function: submittedFillInBlanksAnswer,
              index: index,
              selectedVal: selectedItems[index],
            );
          }).toList(),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Colors.blueGrey.shade100,
              ),
            ),
          ),
          padding: const EdgeInsets.only(top: 5),
          height: 90,
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Questions left : ${totalLen - totalAnswerd}'),
                    Text('Answerd : $totalAnswerd'),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                ElevatedButton(
                  onPressed: () {
                    showBackExitDilog(fromBackButton: false);
                  },
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all<Size>(
                      const Size.fromWidth(200),
                    ),
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                  ),
                  child: const Text('Submit & End-Exam'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
