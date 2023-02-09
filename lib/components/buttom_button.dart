import 'package:flutter/material.dart';
import 'package:bmi_calculator_v1_0/constants.dart';

class ButtomButton extends StatelessWidget {
  ButtomButton({required this.buttonTitle, required this.onTap});

  final Function() onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 90,
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: kthemeColor, borderRadius: BorderRadius.circular(15)),
        child: Center(
            child: Text(
          buttonTitle,
          style: kbottomTextStyle,
        )),
      ),
      onTap: onTap,
    );
  }
}
