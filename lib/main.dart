import 'package:flutter/material.dart';

void main() {
  runApp(const Marathon());
}

class Marathon extends StatelessWidget {
  const Marathon({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
