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
  //List<Player> players = [Player(name: "player1",score: 0, position: 0), Player(name: "player2", score: 0, position: 0)];
  GameService gameService = GameService([Player(name: "player1",score: 0, position: 0), Player(name: "player2", score: 0, position: 0)]);
  QuestionService questionService = QuestionService();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GameProvider(gameService: gameService, questionService: questionService),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Game Screen'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //GameBoard(), // Assuming this is a widget you've created for the game board
                SizedBox(height: 20),
                //QuestionDisplay(), // Assuming this is a widget you've created to display the question
                //AnswerOption(), // Assuming this is a widget you've created for the answer options
                SizedBox(height: 20),
                //DiceButton(), // Assuming this is a widget you've created for the dice button
                Text("Test"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
