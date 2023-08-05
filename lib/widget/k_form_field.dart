import 'package:flutter/material.dart';

class KFormField extends StatelessWidget {
  final String? hint;
  final IconData? sufixIcon;
  final TextEditingController? controller;
  final TextInputType? type;
  final String? Function(String?)? validator;
  const KFormField({
    this.hint,
    this.controller,
    this.type,
    this.sufixIcon,
    this.validator,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: type,
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        suffixIcon: Icon(sufixIcon),
        labelText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      validator: validator,
    );
  }
}
