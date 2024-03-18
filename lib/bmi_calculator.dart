import 'input_page.dart';

class BmiCalculator {
  static Results calculate(Gender gender, int height, int weight, int age) {
    var info = 'overweight';
    var index = 26.7;
    var suggestion =
        'You have a higher that normal body weight. Try to exercise more.';

    return Results(info, index, suggestion);
  }
}

class Results {
  final String info;
  final double index;
  final String suggestion;

  Results(this.info, this.index, this.suggestion);
}
