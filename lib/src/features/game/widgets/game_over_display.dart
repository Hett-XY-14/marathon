import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:marathon/src/features/game/game_provider.dart';
import 'package:marathon/src/features/game/widgets/avatar.dart';
import 'package:marathon/src/shared/styles.dart';

class GameOver extends StatelessWidget {
  GameOver({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer<GameProvider>(
        builder: (context, gameProvider, child) {
          // Null check for currentPlayer and currentQuestion
          if (gameProvider.gameFinished==false) {
            return SizedBox.shrink();  // Return an empty widget if either is null
          }
          return Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(16.0),
            margin: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            width: 600,
            height: 600,
            child: Stack(
              children: [
                Positioned(
                  left: 200,
                  top: 70,
                  child: PlayerAvatar(
                    avatarSize: 200,
                    isCurrentPlayer: true,
                    player: gameProvider.winner!,
                  ),
                ),
                Positioned(
                  right: 30,
                  top: 30,
                  child: Column(
                    children: [
                      Text(gameProvider.winner!.score.toString(), style: title,),
                      Text("Points!", style: subtitle,),
                    ],
                  ),
                ),
                Positioned(
                  width: 550,
                  height: 500,
                  left: null,
                  top: 350,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(gameProvider.winner==null ? "" : "${gameProvider.winner!.name} is the winner!", style: title, textAlign: TextAlign.center,),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}