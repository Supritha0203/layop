import 'package:flutter/material.dart';

class KButtonPrimary extends StatelessWidget {
  const KButtonPrimary({Key? key, required this.text, this.function})
      : super(key: key);

  final String text;
  final VoidCallback? function;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ElevatedButton(
        style: ElevatedButton.styleFrom(fixedSize: Size(size.width, 50)),
        onPressed: function,
        child: Text(text));
  }
}
