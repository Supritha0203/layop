import 'package:flutter/cupertino.dart';

class k_width extends StatelessWidget {
  final double width;
  const k_width({
    super.key,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
    );
  }
}
