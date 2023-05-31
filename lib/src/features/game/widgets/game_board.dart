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
        decoration: BoxDecoration(
          color: Colors.white70,
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
        width: 1400,
        height: 700,
        child: Row(
          children: [
            Expanded(
              flex: 10,
              child: Container(
                color: Colors.white70,
                child: Consumer<GameProvider>(
                  builder: (context, gameProvider, child) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        for (var player in gameProvider.gameService.players)
                        PlayerLine(player: player)
                      ],
                    );
                  },
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.grey,
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