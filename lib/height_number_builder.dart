import 'package:flutter/material.dart';
import 'constants.dart';

Widget HeightNumberBuilder(int index) => RotatedBox(
    quarterTurns: 1,
    child: Container(
        child: Center(
            child: Text((index + 120).toString(), style: kheightTextStyle))));
