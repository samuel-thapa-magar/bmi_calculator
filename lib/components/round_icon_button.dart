import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.icon, this.onPressed, this.colour});

  final IconData icon;
  final Color? colour;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: Icon(
        icon,
        size: 30,
        color: colour,
      ),
      shape: CircleBorder(),
      elevation: 2,
      fillColor: Colors.white,
      constraints: BoxConstraints.tightFor(height: 46, width: 46),
    );
  }
}
