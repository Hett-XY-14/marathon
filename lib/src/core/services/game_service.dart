import '../models/player_model.dart';
import '../models/question_model.dart';
import 'package:marathon/src/core/utils/math_utils.dart';

class GameService {
  List<Player> players;
  int currentPlayerIndex;

  GameService(this.players) : currentPlayerIndex = 0;
  Player get currentPlayer => players[currentPlayerIndex];

  void nextTurn() {
    currentPlayerIndex = (currentPlayerIndex + 1) % players.length-1;
  }

  void updateScore(bool isCorrect, int dieResult) {
    if (isCorrect) {
      currentPlayer.score += 1;
      currentPlayer.position += dieResult;
    } else {
      players[players.length-1].score +=1;
      players[players.length-1].position +=dieResult;
    }
  }

  int rollDice() {
    int result = getRandomNumber(1, 3);
    return result;
  }

  bool isGameOver() {
    if (currentPlayer.position >= 31) return true;
    if (players[players.length-1].position >= 31) return true;
    return false;
  }
}
