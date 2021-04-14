import 'dart:math';

class CalculatorBrain {
  final int weight;
  final int height;

  double _bmi;

  CalculatorBrain({this.weight, this.height});

  String getCalculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'اضافه وزن';
    } else if (_bmi > 18.5) {
      return 'معمولی';
    } else {
      return 'کمبود وزن';
    }
  }

  String getDesc() {
    if (_bmi >= 25) {
      return 'وزن شما زیاد تر از حد معمولی بوده , نیاز به ورزش دارید';
    } else if (_bmi > 18.5) {
      return 'وزن شما معمولیه , باریکلا';
    } else {
      return 'ورن شما کم از حد معمولی بوده , بیشتر غذا بخورید';
    }
  }
}
