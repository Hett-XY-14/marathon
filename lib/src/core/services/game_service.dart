import '../models/player_model.dart';
import '../models/question_model.dart';

class GameService {
  List<Player> players;
  int currentPlayerIndex;

  GameService(this.players) : currentPlayerIndex = 0;

  Player get currentPlayer => players[currentPlayerIndex];

  void nextTurn() {
    currentPlayerIndex = (currentPlayerIndex + 1) % players.length;
  }

  void updateScore(int score) {
    currentPlayer.score += score;
  }

  bool isGameOver() {
    // Implement your game over logic here.
    return false;
  }
}
