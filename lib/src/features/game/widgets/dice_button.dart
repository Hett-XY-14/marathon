import 'package:flutter/material.dart';
import 'package:marathon/src/features/game/game_provider.dart';
import 'package:marathon/src/shared/styles.dart';
import 'package:provider/provider.dart';

class DiceButton extends StatelessWidget {
  DiceButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var gameProvider = Provider.of<GameProvider>(context, listen: false);

    return Positioned(
      bottom: null,
      right: 180,
      child: ElevatedButton(
        child: Text('Roll Dice', style: TextStyle(color: Colors.white)),
        onPressed: gameProvider.loading ? null : gameProvider.gameFinished ? null : () {
          gameProvider.rollDice(); // Use read instead of watch
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
          minimumSize: MaterialStateProperty.all(Size(200, 80)),
          overlayColor: MaterialStateProperty.all(Colors.deepOrangeAccent),
        ),
      ),
    );
  }
}