import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import 'package:marathon/src/core/models/player_model.dart';
import 'package:marathon/src/core/models/question_model.dart';
import 'package:marathon/src/core/services/game_service.dart';
import 'package:marathon/src/core/services/question_service.dart';

class GameProvider with ChangeNotifier {
  final GameService gameService;
  final QuestionService questionService;

  // game state
  Player? currentPlayer;
  Question? currentQuestion;
  int dieResult = 0;
  bool gameFinished = false;

  GameProvider({required this.gameService, required this.questionService}) {
    startGame();
  }

  void startGame() {
    currentPlayer = gameService.currentPlayer;
    notifyListeners();
  }


  void rollDice() async {
    dieResult = gameService.rollDice();
    currentQuestion = questionService.getNextQuestion();
    notifyListeners();
  }

  void answerQuestion(int answer) {
    bool isCorrect = questionService.checkAnswer(answer);
    gameService.updateScore(isCorrect, dieResult);
    gameFinished = gameService.isGameOver() == true ? true : questionService.isGameOver() == true ? true : false;
    gameService.nextTurn();
    notifyListeners();
  }
}
