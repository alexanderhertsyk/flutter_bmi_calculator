import 'dart:math';

import 'enums/bmi.dart';
import 'enums/gender.dart';
import 'logic/results.dart';

class BmiCalculator {
  static Results calculate(Gender gender, int height, int weight, int age) {
    var index = weight / pow(height / 100, 2);
    BMI bmi = BMI.underweight1;

    for (var bmiValue in BMI.values) {
      if (bmiValue.min <= index && index <= bmiValue.max) {
        bmi = bmiValue;

        break;
      }
    }

    var suggestion = _getSuggestion(bmi);

    return Results(bmi.name, index, suggestion);
  }

  static String _getSuggestion(BMI bmi) => switch (bmi) {
        BMI.underweight3 => 'You must eat more!!!',
        BMI.underweight2 => 'You have to eat more!',
        BMI.underweight1 => 'Are you hungry?',
        BMI.healthy => 'Keep up the good work ;)',
        BMI.overweight => 'Let\'s go for a walk.',
        BMI.obese1 => 'It\'s time to stand up & buy a gym\'s ticket!',
        BMI.obese2 => 'OMG! Stop eating at least you\'re checking BMI!',
        BMI.obese3 => 'Call to the ambulance! We\'re losing that person!!!'
      };
}
