import 'package:flutter/material.dart';
import 'package:marathon/src/core/models/player_model.dart';
import 'package:marathon/src/shared/styles.dart';

class PlayerAvatar extends StatelessWidget {
  double avatarSize;
  bool isCurrentPlayer;
  Player player;

  PlayerAvatar({required this.avatarSize, required this.isCurrentPlayer, required this.player});

  @override
  Widget build (BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Container(
            width: avatarSize,
            height: avatarSize,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              shape: BoxShape.rectangle,
              border:  isCurrentPlayer ?
                Border.all(color: Colors.orange, width: 5) :
                Border.all(color: Colors.white, width: 3),
              image: DecorationImage(
                image: AssetImage(player.avatar),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Text(
            player.name,
            style: title
        ),
        Text(
            "${player.position.toString()} Km",
            style: subtitle
        ),
      ],
    );
  }
}
