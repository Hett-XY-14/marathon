import 'package:flutter/material.dart';
import '../../../core/models/question_model.dart';

class QuestionDisplay extends StatelessWidget {
  final Question question;

  QuestionDisplay({required this.question});

  @override
  Widget build(BuildContext context) {
    return Text(question.questionText);
  }
}
