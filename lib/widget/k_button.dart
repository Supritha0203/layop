import 'package:flutter/material.dart';
import 'package:layop2/util/app_constant.dart';

class KButtonPrimary extends StatelessWidget {
  const KButtonPrimary({Key? key, required this.text, this.function})
      : super(key: key);

  final String text;
  final VoidCallback? function;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppConstant.primaryColor,
        fixedSize: Size(size.width, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstant.borderRadiusWidget),
        ),
      ),
      onPressed: function,
      child: Text(
        text,
        style: const TextStyle(fontFamily: 'Montserrat'),
      ),
    );
  }
}
