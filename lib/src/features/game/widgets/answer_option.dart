import 'package:flutter/material.dart';

class AnswerOption extends StatelessWidget {
  final String option;
  final VoidCallback onSelect;

  AnswerOption({required this.option, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(option),
      onPressed: onSelect,
    );
  }
}
