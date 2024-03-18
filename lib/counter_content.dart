import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constants.dart';
import 'round_icon_button.dart';

class CounterContent extends StatelessWidget {
  const CounterContent(
      {super.key,
      required this.title,
      required this.value,
      required this.onSubstractPressed,
      required this.onAddPressed});

  final String title;
  final int value;
  final VoidCallback onSubstractPressed;
  final VoidCallback onAddPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: kLabelTextStyle,
        ),
        Text(
          value.toString(),
          style: kNumberTextStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundIconButton(
              FontAwesomeIcons.minus,
              onPressed: onSubstractPressed,
            ),
            const SizedBox(width: 10.0),
            RoundIconButton(
              FontAwesomeIcons.plus,
              onPressed: onSubstractPressed,
            ),
          ],
        )
      ],
    );
  }
}
