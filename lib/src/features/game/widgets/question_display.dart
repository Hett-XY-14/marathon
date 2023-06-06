import 'package:flutter/material.dart';
import 'package:marathon/src/features/game/game_provider.dart';
import 'package:marathon/src/shared/styles.dart';
import 'package:provider/provider.dart';
import '../../../core/models/question_model.dart';
import 'package:marathon/src/features/game/widgets/avatar.dart';

class QuestionDisplay extends StatelessWidget {
  QuestionDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer<GameProvider>(
        builder: (context, gameProvider, child) {
          // Null check for currentPlayer and currentQuestion
          if (gameProvider.currentPlayer == null || gameProvider.currentQuestion == null) {
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
            height: 800,
            child: Stack(
              children: [
                Positioned(
                  left: 30,
                  top: 30,
                  child: PlayerAvatar(
                    avatarSize: 90,
                    isCurrentPlayer: true,
                    player: gameProvider.currentPlayer!,  // Removed !
                  ),
                ),
                Positioned(
                  right: 30,
                  top: 30,
                  child: Column(
                    children: [
                      Text(gameProvider.dieResult.toString(), style: title,),
                      Text("casillas", style: subtitle,),
                    ],
                  ),
                ),
                Positioned(
                  width: 550,
                  height: 500,
                  left: null,
                  top: 300,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(gameProvider.currentQuestion==null ? "" : gameProvider.currentQuestion!.question, style: title, textAlign: TextAlign.center,),
                      ),
                      Expanded(
                        flex: 3,
                        child: ListView.builder(
                          itemCount: gameProvider.currentQuestion!.answers.length,
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                shape: BoxShape.rectangle,
                                color: Colors.black12,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2.0,
                                ),
                              ),
                              child: ListTile(
                                title: Text(gameProvider.currentQuestion!.answers[index], style: paragraph),
                                onTap: () {
                                  gameProvider.answerQuestion(index);
                                },
                              ),
                            );
                          },
                        ),
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
