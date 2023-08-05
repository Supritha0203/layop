import 'package:flutter/material.dart';

class KText extends StatelessWidget {
  final String text;
  final TextOverflow? overflow;
  final Color? color;
  final FontWeight? weight;
  final double? size;
  const KText({
    Key? key,
    required this.text,
    this.color,
    this.overflow,
    this.size,
    this.weight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          overflow: overflow,
          fontSize: size,
          fontWeight: weight,
          fontFamily: 'Montserrat',
          color: color),
    );
  }
}
