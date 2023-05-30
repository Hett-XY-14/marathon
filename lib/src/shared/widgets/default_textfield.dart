import 'package:flutter/material.dart';

class DefaultTextField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;

  DefaultTextField({required this.hint, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(hintText: hint),
    );
  }
}