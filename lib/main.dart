import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:marathon/src/features/game/init_page.dart';
import 'firebase_options.dart';
import 'dart:async';
import 'src/features/game/game_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatelessWidget {
  App({super.key});

  final Future<FirebaseApp> _initialization = Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // While Firebase is initializing, show a loading indicator
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            // If an error occurred during initialization, display an error message
            return Text('Error initializing Firebase: ${snapshot.error}');
          } else {
            // Firebase initialization is complete, proceed with the app's UI
            return MaterialApp(
              title: 'Navigation Demo',
              home: InitPage(),
            );
          }
        },
    );
  }
}
