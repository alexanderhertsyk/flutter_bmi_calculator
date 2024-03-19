enum BMI {
  underweight3('severe thinness', 0.0, 15.9),
  underweight2('Moderate thinness', 16.0, 16.9),
  underweight1('mild thinness', 17.0, 18.4),
  healthy('normal', 18.5, 24.9),
  overweight('pre-obese', 25.0, 29.9),
  obese1('obese class I', 30.0, 34.9),
  obese2('obese class II', 35.0, 39.9),
  obese3('obese class III', 40.0, double.infinity);

  const BMI(this.name, this.min, this.max);

  final String name;
  final double min;
  final double max;
}
