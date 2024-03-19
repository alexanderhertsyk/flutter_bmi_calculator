import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

import '../logic/results.dart';
import '../widgets/bottom_button.dart';
import '../widgets/reusable_card.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage(this.results, {super.key});
  final Results results;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 15.0, top: 20.0),
            child: Text(
              'Your Result',
              style: kHugeButtonTextStyle,
            ),
          ),
          Expanded(
              child: ReusableCard(
            color: kInactiveCardColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  results.info.toUpperCase(),
                  style: kResultInfoTextStyle,
                ),
                Text(
                  results.index.toStringAsFixed(1),
                  style: kResultValueTextStyle,
                ),
                Text(
                  results.suggestion,
                  textAlign: TextAlign.center,
                  style: kResultSuggestionTextStyle,
                ),
              ],
            ),
          )),
          BottomButton(
            title: 'RE-CALCULATE',
            onTap: () => Navigator.pop(context, true),
          )
        ],
      ),
    );
  }
}
