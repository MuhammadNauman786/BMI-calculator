
import 'dart:math';

class CalculatorBrain{
  final int height;
  final int weight;
  double _bmi = 0.0;

  CalculatorBrain(this.height, this.weight);

  String CalculateBMI(){
    _bmi = weight/pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult(){
    if(_bmi >= 25){
      return 'Overweight';
    }
    else if(_bmi > 18.5){
      return 'Normal';
    }
    else{
      return 'Underweight';
    }
  }

  String getInterpretation(){
    String interpretation = "";
    if(_bmi >= 25){
      interpretation = 'You have a higher then normal body weight So, try exercise more.';
    }
    else if(_bmi >= 18.5){
      interpretation =  'You have a normal body weight. Good job!';
    }
    else{
      interpretation =  'You have a lower then normal body weight So, try to eat more.';
    }
    return interpretation;
  }

}