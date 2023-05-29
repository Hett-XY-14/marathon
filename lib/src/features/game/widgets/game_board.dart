import 'package:flutter/material.dart';
import '../../../core/models/player_model.dart';

class GameBoard extends StatelessWidget {
  final Player player;

  GameBoard({required this.player});

  @override
  Widget build(BuildContext context) {
    return Text('${player.name}: ${player.score} km');
    // A more sophisticated implementation would visually represent the 42 km track.
  }
}
