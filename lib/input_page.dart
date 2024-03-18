import 'package:bmi_calculator/bmi_calculator.dart';
import 'package:bmi_calculator/bottom_button.dart';
import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constants.dart';
import 'counter_content.dart';
import 'icon_content.dart';
import 'reusable_card.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> with WidgetsBindingObserver {
  Gender? _gender;
  late int _height;
  late int _weight;
  late int _age;

  Future<void> calculate() async {
    var results = BmiCalculator.calculate(_gender!, _height, _weight, _age);

    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return ResultsPage(results);
      }),
    );

    if (!context.mounted) return;

    reset();
  }

  void reset() => setState(() {
        _gender = null;
        _height = 175;
        _weight = 70;
        _age = 25;
      });

  @override
  void initState() {
    super.initState();

    reset();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    print('----------------------------------------------------------');
    print(state.toString());
  }

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
                    color: _gender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    child: const IconContent(
                      icon: FontAwesomeIcons.mars,
                      title: 'MALE',
                    ),
                    onTap: () => setState(() => _gender = Gender.male),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: _gender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    child: const IconContent(
                      icon: FontAwesomeIcons.venus,
                      title: 'FEMALE',
                    ),
                    onTap: () => setState(() => _gender = Gender.female),
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
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: ReusableCard(
                  color: kActiveCardColor,
                  child: CounterContent(
                    title: 'WEIGHT',
                    value: _weight,
                    onSubstractPressed: () =>
                        _weight > 40 ? setState(() => _weight--) : null,
                    onAddPressed: () =>
                        _weight < 200 ? setState(() => _weight++) : null,
                  ),
                )),
                Expanded(
                  child: ReusableCard(
                    color: kActiveCardColor,
                    child: CounterContent(
                      title: 'AGE',
                      value: _age,
                      onSubstractPressed: () =>
                          _age > 0 ? setState(() => _age--) : null,
                      onAddPressed: () =>
                          _age < 130 ? setState(() => _age++) : null,
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            title: 'CALCULATE',
            onTap: () => _gender != null ? calculate() : null,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);

    super.dispose();
  }
}
