import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constants.dart';
import 'icon_card.dart';
import 'reusable_card.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? _selectedGender;
  int _height = 175;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: _selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    child: const IconCard(
                      icon: FontAwesomeIcons.mars,
                      title: 'MALE',
                    ),
                    onTap: () => setState(() => _selectedGender = Gender.male),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: _selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    child: const IconCard(
                      icon: FontAwesomeIcons.venus,
                      title: 'FEMALE',
                    ),
                    onTap: () =>
                        setState(() => _selectedGender = Gender.female),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: kActiveCardColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        _height.toString(),
                        style: kNumberTextStyle,
                      ),
                      const Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: kSliderInactiveColor,
                      activeTrackColor: Colors.white,
                      thumbColor: kBottomContainerColor,
                      overlayColor: kBottomContainerColor.withAlpha(29),
                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          const RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      min: 120,
                      max: 220,
                      value: _height.toDouble(),
                      onChanged: (double value) => setState(() {
                        _height = value.round();
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Expanded(
            child: Row(
              children: [
                Expanded(child: ReusableCard(color: kActiveCardColor)),
                Expanded(child: ReusableCard(color: kActiveCardColor)),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: kBottomContainerHeight,
            color: kBottomContainerColor,
            margin: const EdgeInsets.only(top: 10.0),
          )
        ],
      ),
    );
  }
}
