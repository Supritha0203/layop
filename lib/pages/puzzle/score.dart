import 'package:flutter/material.dart';
import 'package:layop2/pages/student_home.dart';
import 'package:layop2/widget/k_button_primary.dart';
import 'package:layop2/widget/k_height.dart';

class Score extends StatefulWidget {
  final int? score;
  const Score({this.score, Key? key}) : super(key: key);

  @override
  State<Score> createState() => _ScoreState();
}

class _ScoreState extends State<Score> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Your Score is ${widget.score}'),
          KHeight(height: 10),
          KButtonPrimary(
            text: "Back to home page",
            function: () => {redirect()},
          )
        ],
      )

          //   child: Padding(
          // padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 50),
          // child: Center(child: Text("OK ${widget.score}")),
          ),
    );
  }

  void redirect() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const StudentHome()));
  }
}
