import 'package:flutter/material.dart';
import 'package:marathon/src/core/models/player_model.dart';
import 'package:marathon/src/features/game/game_provider.dart';
import 'package:marathon/src/features/game/widgets/player_position.dart';
import 'package:provider/provider.dart';

class PlayerLine extends StatelessWidget {
  Player? player;
  PlayerLine({super.key, required this.player});

  @override
  Widget build(BuildContext context) {
    //double playerPosition = player?.position == null ? 0 : player?.position == 0 ? 0 : 31 * player!.position;
    return Expanded(
      child: Stack(
        children: [
          Divider(
            color: Colors.black54,
            thickness: 1,
          ),
          Consumer<GameProvider>(
            builder: (context, gameProvider, child) {
              return PlayerPosition(
                  player: player!,
                  isCurrentPlayer: gameProvider.gameService.currentPlayer.name == player!.name ? true : false
              );
            }
          ),
          Divider(
            color: Colors.black54,
            thickness: 1,
          ),
        ],
      )
    );
  }
}
