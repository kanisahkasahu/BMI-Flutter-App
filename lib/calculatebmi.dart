
import 'dart:math';
import 'package:flutter/material.dart';

 
class CalculatorBrain {
CalculatorBrain({@required this.height, @required this.weight});
final int height ; 
final int weight ;
double  _bmi; 
String calculateBMI() {

double _bmi = weight / pow(height/100 , 2 );

 
return _bmi.toStringAsFixed(1);

     }
  
 String getResults(){
   if(_bmi >= 15.0){
     return 'OVER WEIGHT';
     }
  else if (_bmi > 18.0){
      return 'NORMAL ';
  }
  else{
    return 'UNDER WEIGHT';
  }
 }

 String bmiInterpretation(){
   if(_bmi >=  20.0){
     return 'hey you are too much fatty try to Excercise and walk , very Bad!';}
  else if (_bmi >= 25.0){
      return 'Good Job! congratulations you are normal you can eat moew';
  }
  else{
    return 'Offo ! your bmi is too low you need to eat some pizza or burgers';
  }
 }
}
