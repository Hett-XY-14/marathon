import 'package:marathon/src/core/models/player_model.dart';
import 'package:marathon/src/core/services/question_service.dart';
import 'package:marathon/src/features/game/widgets/question_display.dart';
import 'package:marathon/src/features/game/widgets/answer_option.dart';
import 'package:marathon/src/features/game/widgets/dice_button.dart';
import 'package:marathon/src/features/game/widgets/game_board.dart';
import 'package:marathon/src/features/game/game_provider.dart';
import 'package:marathon/src/core/services/game_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GamePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final gameProvider = Provider.of<GameProvider>(context);

    List<Widget> stackChildren = [
      GameBoard(),
    ];

    if (gameProvider.diceRolled) {
      stackChildren.add(QuestionDisplay());
    }

    stackChildren.addAll([
      DiceButton(),
    ]);

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

