import '../models/player_model.dart';
import '../models/question_model.dart';
import 'package:marathon/src/core/utils/math_utils.dart';

class GameService {
  List<Player> players;
  int currentPlayerIndex;
  Player ignorance = Player(name: "ignorance", score: 0);

  GameService(this.players) : currentPlayerIndex = 0;
  Player get currentPlayer => players[currentPlayerIndex];

  void nextTurn() {
    currentPlayerIndex = (currentPlayerIndex + 1) % players.length;
  }

  void updateScore(bool isCorrect, int dieResult) {
    if (isCorrect) {
      currentPlayer.score += 1;
      currentPlayer.position += dieResult;
    } else {
      ignorance.score +=1;
      ignorance.position +=dieResult;
    }
  }

  int rollDice() {
    int result = getRandomNumber(1, 3);
    return result;
  }

  bool isGameOver() {
    if (currentPlayer.position >= 31) return true;
    if (ignorance.position >= 31) return true;
    return false;
  }
}
