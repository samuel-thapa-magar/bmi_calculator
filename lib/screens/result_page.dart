import 'package:bmi_calculator_v1_0/components/buttom_button.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator_v1_0/constants.dart';
import 'package:bmi_calculator_v1_0/components/dynamic_card.dart';
import 'package:bmi_calculator_v1_0/screens//homepage.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {required this.bmiValue,
      required this.bmiGrade,
      required this.suggestion});

  final String bmiValue;
  final String bmiGrade;
  final String suggestion;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F6FD),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            'BMI Calculator',
            style: kappbarTextStyle,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Center(
                  child: Text(
            'Your Result',
            style: kresultHeadingStyle,
          ))),
          Expanded(
            flex: 5,
            child: DynamicCard(
              colour: Colors.white,
              cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(bmiGrade, style: kBMIGradeTextStyle),
                    SizedBox(height: 100),
                    Text(bmiValue, style: kresultTextStyle),
                    SizedBox(height: 90),
                    Text(suggestion,
                        textAlign: TextAlign.center,
                        style: ksuggestionTextStyle),
                    SizedBox(height: 60),
                  ]),
            ),
          ),
          ButtomButton(
              buttonTitle: 'Re-Calculate',
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Homepage()));
              }),
        ],
      ),
    );
  }
}
