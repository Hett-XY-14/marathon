import 'package:marathon/src/features/game/widgets/question_display.dart';
import 'package:marathon/src/features/game/widgets/dice_button.dart';
import 'package:marathon/src/features/game/widgets/game_board.dart';
import 'package:marathon/src/features/game/game_provider.dart';
import 'package:marathon/src/features/game/widgets/game_over_display.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GamePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final gameProvider = Provider.of<GameProvider>(context);

    List<Widget> stackChildren = [
      GameBoard(),
      DiceButton()
    ];

    if (gameProvider.diceRolled) {
      stackChildren.add(QuestionDisplay());
    }

    if (gameProvider.gameFinished) {
      stackChildren.add(GameOver());
    }


    return Scaffold(
      appBar: AppBar(
        title: Text('Marathon'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: stackChildren,
          ),
        ),
      ),
    );
  }
}

