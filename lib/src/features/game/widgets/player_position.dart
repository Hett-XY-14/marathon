import 'package:flutter/material.dart';
import 'package:marathon/src/core/models/player_model.dart';
import 'package:marathon/src/features/game/widgets/avatar.dart';
import 'package:marathon/src/shared/styles.dart';

class PlayerPosition extends StatelessWidget {
  final Player player;
  final bool isCurrentPlayer;

  const PlayerPosition({
    Key? key,
    required this.player,
    required this.isCurrentPlayer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int playerPosition = player.position;

    // Calculate the position of the avatar on the board based on the player's position
    double boardWidth = 1400;
    double avatarSize = 90;
    double maxPosition = 31;
    double boardPadding = avatarSize / 2;
    double positionFraction = playerPosition / maxPosition;
    double avatarX = (boardWidth - boardPadding * 2) * positionFraction + boardPadding;

    return Positioned(
      top: 30,
      left: avatarX - avatarSize / 2,
      child: PlayerAvatar(
          avatarSize: avatarSize,
          isCurrentPlayer: isCurrentPlayer,
          player: player
      )
    );
  }
}
