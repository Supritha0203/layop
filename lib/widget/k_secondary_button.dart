import 'package:flutter/material.dart';

class KSecondaryButton extends StatelessWidget {
  const KSecondaryButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      // ignore: sort_child_properties_last
      child:  const Text('Button'),
      style: OutlinedButton.styleFrom(
        shape: const StadiumBorder(),
      ),
    );
  }
}
