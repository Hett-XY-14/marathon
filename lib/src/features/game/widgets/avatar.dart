import 'package:flutter/material.dart';
import 'package:marathon/src/core/models/player_model.dart';

class PlayerAvatar extends StatelessWidget {
  final Player player;
  final bool isCurrentPlayer;

  const PlayerAvatar({
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
      top: 0,
      left: avatarX - avatarSize / 2,
      child: Column(
        children: [
          ClipOval(
            child: Container(
              width: avatarSize,
              height: avatarSize,
              color: isCurrentPlayer ? Colors.green : Colors.blue,
              child: Image.asset(
                player.avatar,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            player.name,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            player.score.toString(),
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
