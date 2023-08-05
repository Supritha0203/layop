import 'package:flutter/material.dart';
import 'package:layop2/widget/k_button_primary.dart';

import 'puzzle_image.dart';
import 'puzzle_sound.dart';

class PuzzlePage extends StatefulWidget {
  PuzzlePage({Key? key}) : super(key: key);

  @override
  State<PuzzlePage> createState() => _QuizState();
}

class _QuizState extends State<PuzzlePage> {
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
            child: Column(
              children: [
                Padding(
                  child: KButtonPrimary(
                    text: "Image Puzzles",
                    function: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PuzzleImage(),
                        ),
                      );
                    },
                  ),
                  padding: const EdgeInsets.all(10.0),
                ),
                Padding(
                  child: KButtonPrimary(
                    text: "Sound Puzzles",
                    function: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PuzzleSound(),
                        ),
                      );
                    },
                  ),
                  padding: const EdgeInsets.all(10.0),
                ),
              ],
            )),
      ),
    );
  }

  Widget getWidget(String type, String asset) {
    if (type == "image") {}
    return Image(image: AssetImage(asset));
  }
}
