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

  Player? currentPlayer;
  Question? currentQuestion;
  int dieResult = 0;
  bool diceRolled = false;
  bool gameFinished = false;
  bool loading = true;

  GameProvider({required this.gameService, required this.questionService,}) {
    startGame();
  }

  void startGame() async {
    currentPlayer = gameService.currentPlayer;
    await questionService.fetchQuestions();
    loading = false;
    diceRolled = false; // Reset the dice roll flag at the start of the game
    notifyListeners();
  }


  void rollDice() {
    dieResult = gameService.rollDice();
    diceRolled = true; // Set the dice roll flag after rolling the dice
    currentQuestion = questionService.getNextQuestion();
    notifyListeners();
  }

  void answerQuestion(int answer) {
    bool isCorrect = questionService.checkAnswer(answer);
    gameService.updateScore(isCorrect, dieResult);
    gameFinished = gameService.isGameOver() == true ? true : questionService.isGameOver() == true ? true : false;
    diceRolled = false; // Reset the dice roll flag after answering the question
    gameService.nextTurn();
    notifyListeners();
  }
}

