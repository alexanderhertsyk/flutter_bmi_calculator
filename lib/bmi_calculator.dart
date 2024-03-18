import 'dart:math';

import 'input_page.dart';

class BmiCalculator {
  static Results calculate(Gender gender, int height, int weight, int age) {
    var index = weight / pow(height / 100, 2);
    BMI bmi = BMI.underweight1;

    for (var bmiValue in BMI.values) {
      if (bmiValue.min <= index && index <= bmiValue.max) {
        bmi = bmiValue;
      }
    }

    return Results(bmi.name, index, bmi.suggestion);
  }
}

class Results {
  final String info;
  final double index;
  final String suggestion;

  Results(this.info, this.index, this.suggestion);
}

enum BMI {
  underweight3('severe thinness', 0.0, 15.9, 'You must eat more!!!'),
  underweight2('Moderate thinness', 16.0, 16.9, 'You have to eat more!'),
  underweight1('mild thinness', 17.0, 18.4, 'Are you hungry?'),
  healthy('normal', 18.5, 24.9, 'Keep up the good work ;)'),
  overweight('pre-obese', 25.0, 29.9, 'Let\'s go for a walk.'),
  obese1('obese class I', 30.0, 34.9,
      'It\'s time to stand up & buy a gym\'s ticket!'),
  obese2('obese class II', 35.0, 39.9,
      'OMG! Stop eating at least you\'re checking BMI!'),
  obese3('obese class III', 40.0, double.infinity,
      'Call to the ambulance! We\'re losing that person!!!');

  const BMI(this.name, this.min, this.max, this.suggestion);

  final String name;
  final double min;
  final double max;
  final String suggestion;
}
