import 'package:flutter/material.dart';

import 'constants.dart';

class RoundIconButton extends StatelessWidget {
  const RoundIconButton(this.icon, {super.key, required this.press});

  final IconData? icon;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: press,
      elevation: 6.0,
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: const CircleBorder(),
      fillColor: kButtonBackgroundColor,
      child: Icon(icon),
    );
  }
}
