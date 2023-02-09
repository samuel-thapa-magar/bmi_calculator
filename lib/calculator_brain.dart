import 'dart:math';
import 'package:flutter/material.dart';

class CalculatorBrain {
  CalculatorBrain({required this.height, required this.weight});

  final int height;
  final int weight;
  double _bmi = 0;

  String? getBMIValue() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String? getBMIGrade() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String? getSuggestion() {
    if (_bmi >= 25) {
      return 'Your body weight is higher than normal.Try to exercise more.';
    } else if (_bmi > 18.5) {
      return 'You have a normal body weight. Good job';
    } else {
      return 'Your body weight is less than normal. You can eat more';
    }
  }
}
