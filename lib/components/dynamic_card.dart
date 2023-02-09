// This is a custom widget used multiple times in this project

import 'package:flutter/material.dart';

class DynamicCard extends StatelessWidget {
  DynamicCard({required this.colour, required this.cardChild, this.onPress});

  final Color colour;
  final Widget cardChild;
  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 7,
              offset: Offset(5, 5),
            )
          ],
        ),
      ),
    );
  }
}
