import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'icon_card.dart';
import 'reusable_card.dart';

const activeCardColor = Color(0xFF1D1E33);
const inactiveCardColor = Color(0xFF111328);
const bottomContainerHeight = 80.0;
const bottomContainerColor = Color(0xFFEB1555);

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = inactiveCardColor;
  Color femaleCardColor = inactiveCardColor;

  void setGenderCardColor(Gender gender) => setState(() {
        if (gender == Gender.male && maleCardColor == inactiveCardColor) {
          femaleCardColor = inactiveCardColor;
          maleCardColor = activeCardColor;
        } else if (gender == Gender.female &&
            femaleCardColor == inactiveCardColor) {
          maleCardColor = inactiveCardColor;
          femaleCardColor = activeCardColor;
        }
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => setGenderCardColor(Gender.male),
                    child: ReusableCard(
                      color: maleCardColor,
                      child: const IconCard(
                        icon: FontAwesomeIcons.mars,
                        title: 'MALE',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => setGenderCardColor(Gender.female),
                    child: ReusableCard(
                      color: femaleCardColor,
                      child: const IconCard(
                        icon: FontAwesomeIcons.venus,
                        title: 'FEMALE',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Expanded(child: ReusableCard(color: activeCardColor)),
          const Expanded(
            child: Row(
              children: [
                Expanded(child: ReusableCard(color: activeCardColor)),
                Expanded(child: ReusableCard(color: activeCardColor)),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: bottomContainerHeight,
            color: bottomContainerColor,
            margin: const EdgeInsets.only(top: 10.0),
          )
        ],
      ),
    );
  }
}
