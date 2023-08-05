import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:layop2/pages/quiz/json_question_parser.dart';

// Widget fillInBlanksWidget(
//     {Question question, Function function, int index, int selectedVal}) {
//   final _controller = TextEditingController(
//       text: selectedVal != -1234567890123411123 ? '$selectedVal' : '');
//   String value = '';
//   return
// }

class FillInBlanks extends StatefulWidget {
  final Question question;
  final Function function;
  final int index, selectedVal;

  const FillInBlanks(
      {Key? key,
      required this.question,
      required this.function,
      required this.index,
      required this.selectedVal})
      : super(key: key);
  @override
  _FillInBlanksState createState() => _FillInBlanksState();
}

class _FillInBlanksState extends State<FillInBlanks> {
  String value = '';
  late TextEditingController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TextEditingController(
        text: widget.selectedVal != -1234567890123411123
            ? '${widget.selectedVal}'
            : '');
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: Text(
            widget.question.question,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
          ),
          child: TextFormField(
            // controller  : TextEditingController()..text = 'Your initial value',
            // initialValue: widget.selectedVal != -1234567890123411123
            //     ? '${widget.selectedVal}'
            //     : '',
            controller: _controller,
            onChanged: (val) {
              setState(() {
                value = val;
              });
            },
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              fillColor: Colors.grey[100],
              filled: true,
              hintText: 'Answer',
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () {
                if (widget.selectedVal != -1234567890123411123) {
                  widget.function(widget.index, -1234567890123411123);
                  setState(() {
                    _controller.text = '';
                  });
                }
              },
              child:const Text(
                'Clear answer',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                log('value $value');
                if (num.tryParse(value) != null) {
                  widget.function(widget.index, num.parse(value));
                } else {
                  // Fluttertoast.showToast(
                  //   msg: 'Invalid number',
                  //   backgroundColor: Colors.deepOrange,
                  //   textColor: Colors.white,
                  //   toastLength: Toast.LENGTH_LONG,
                  // );

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Invalid number'),
                      backgroundColor: Colors.deepOrange,
                    ),
                  );
                }
              },
              child: const Text(
                'Submit',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
