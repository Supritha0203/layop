import 'package:flutter/material.dart';

import '../../data/puzzle_list_images.dart';
import 'score.dart';

class PuzzleImage extends StatefulWidget {
  PuzzleImage({Key? key}) : super(key: key);

  @override
  State<PuzzleImage> createState() => _QuizState();
}

class _QuizState extends State<PuzzleImage> {
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
            itemCount: puzzleListImage.length,
            itemBuilder: (context, index) => Column(children: [
              Row(
                children: [
                  Text(
                    "Question ${index + 1}/ ${puzzleListImage.length}",
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
                  puzzleListImage[index].question!,
                  style: const TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: getWidget(
                      puzzleListImage[index].type!, puzzleListImage[index].asset!)),
              const SizedBox(
                height: 20,
              ),
              for (int i = 0; i < puzzleListImage[index].answer!.length; i++)
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: isPressed
                            ? puzzleListImage[index]
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
                            if (puzzleListImage[index]
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
                    child: Text(puzzleListImage[index].answer!.keys.toList()[i])),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                      onTap: isPressed
                          ? index + 1 == puzzleListImage.length
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
                      child: Text(index + 1 == puzzleListImage.length
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
    return Image(image: AssetImage(asset));
  }
}
