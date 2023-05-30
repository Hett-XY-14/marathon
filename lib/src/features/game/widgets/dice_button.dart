import 'package:flutter/material.dart';

class DiceButton extends StatelessWidget {
  final VoidCallback onRoll;

  DiceButton({required this.onRoll});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text('Roll Dice'),
      onPressed: onRoll,
    );
  }
}
