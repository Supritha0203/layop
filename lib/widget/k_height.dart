import 'package:flutter/material.dart';

class KHeight extends StatelessWidget {
  const KHeight({
    Key? key,
    required this.height,
  }) : super(key: key);
  final double height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}
