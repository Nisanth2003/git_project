import 'package:flutter/material.dart';

class DiceImage extends StatelessWidget {
  final int diceNumber;

  DiceImage({required this.diceNumber});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/dice$diceNumber.png',
      width: 100,
      height: 100,
    );
  }
}
