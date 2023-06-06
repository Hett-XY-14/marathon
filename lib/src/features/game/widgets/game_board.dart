import 'package:flutter/material.dart';
import 'package:marathon/src/features/game/widgets/player_line.dart';
import 'package:provider/provider.dart';
import 'package:marathon/src/features/game/game_provider.dart';
import 'package:marathon/src/core/models/player_model.dart';

class GameBoard extends StatelessWidget {

  GameBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.all(8.0),
        decoration: boxDecoration,
        width: 1400,
        height: 700,
        child: Row(
          children: [
            Expanded(
              flex: 10,
              child: Container(
                decoration: boxDecoration,
                child: Consumer<GameProvider>(
                  builder: (context, gameProvider, child) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,

                      children: [
                        for (var player in gameProvider.gameService.players)
                        PlayerLine(player: player),
                      ],
                    );
                  },
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                decoration: boxDecoration,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('M', style: TextStyle(fontSize: 56.0)),
                    Text('E', style: TextStyle(fontSize: 56.0)),
                    Text('T', style: TextStyle(fontSize: 56.0)),
                    Text('A', style: TextStyle(fontSize: 56.0)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

var boxDecoration = const BoxDecoration(
  border: Border(
    top: BorderSide(
      color: Colors.black,
      width: 1.0,
    ),
    bottom: BorderSide(
      color: Colors.black,
      width: 1.0,
    ),
    right: BorderSide(
      color: Colors.black,
      width: 1.0,
    ),
  ),
  color: Colors.white10
);