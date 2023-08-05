import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import '../../data/puzzle_list_sound.dart';
import '../../widget/k_button.dart';
import 'score.dart';

class PuzzleSound extends StatefulWidget {
  PuzzleSound({Key? key}) : super(key: key);

  @override
  State<PuzzleSound> createState() => _QuizState();
}

class _QuizState extends State<PuzzleSound> {
  final PageController _controller = PageController(initialPage: 0);
  bool isPressed = false;
  int score = 0;
  Color isTrue = Colors.green;
  Color isWrong = Colors.red;
  Color isNull = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 50),
          child: PageView.builder(
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: (page) {
              setState(() {
                isPressed = false;
              });
            },
            controller: _controller,
            itemCount: puzzleListSound.length,
            itemBuilder: (context, index) => Column(children: [
              Row(
                children: [
                  Text(
                    "Question ${index + 1}/ ${puzzleListSound.length}",
                    style: const TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
              const Divider(
                thickness: 1.0,
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                width: double.infinity,
                child: Text(
                  puzzleListSound[index].question!,
                  style: const TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: getWidget(puzzleListSound[index].type!,
                      puzzleListSound[index].asset!)),
              const SizedBox(
                height: 20,
              ),
              for (int i = 0; i < puzzleListSound[index].answer!.length; i++)
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: isPressed
                            ? puzzleListSound[index]
                                    .answer!
                                    .entries
                                    .toList()[i]
                                    .value
                                ? isTrue
                                : isWrong
                            : isNull,
                        fixedSize: Size(MediaQuery.of(context).size.width, 30)),
                    onPressed: isPressed
                        ? () {}
                        : () {
                            setState(() {
                              isPressed = true;
                            });
                            if (puzzleListSound[index]
                                .answer!
                                .entries
                                .toList()[i]
                                .value) {
                              score += 10;
                            } else {
                              setState(() {
                                isNull = isWrong;
                              });
                            }
                          },
                    child:
                        Text(puzzleListSound[index].answer!.keys.toList()[i])),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                      onTap: isPressed
                          ? index + 1 == puzzleListSound.length
                              ? () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            Score(score: score),
                                      ));
                                }
                              : () {
                                  _controller.nextPage(
                                      duration:
                                          const Duration(milliseconds: 500),
                                      curve: Curves.linear);
                                  setState(() {
                                    isPressed = false;
                                  });
                                }
                          : null,
                      child: Text(index + 1 == puzzleListSound.length
                          ? "voir le resultat"
                          : "Next"))
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }

  Widget getWidget(String type, String asset) {
    if (type == "image") {}
    return KButtonPrimary(
      text: "Play",
      function: () async {
        print(asset);
        AudioCache(prefix: asset); // Create a player
         // Play the sound
      },
    );
  }
}
