import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:marathon/main.dart';
import 'package:marathon/src/core/services/game_service.dart';
import 'package:marathon/src/shared/styles.dart';
import 'package:provider/provider.dart';
import 'package:marathon/src/features/game/game_page.dart';
import 'package:marathon/src/core/models/player_model.dart';
import 'package:marathon/src/features/game/game_provider.dart';
import 'package:marathon/src/core/services/question_service.dart';


class SetupPage extends StatefulWidget {
  @override
  _SetupPageState createState() => _SetupPageState();
}

class _SetupPageState extends State<SetupPage> {
  final List<String> _avatars = [
    "lib/src/assets/cat.jpg",
    "lib/src/assets/coon.jpg",
    "lib/src/assets/dino.jpg",
    "lib/src/assets/dogo.jpg",
  ];
  List<Player> _players = [];
  String? _selectedAvatar;
  String? _selectedName;
  final _playerNameController = TextEditingController();

  void addPlayer(String name, String avatar) {
    setState(() {
      _players.add(Player(name: name, avatar: avatar, score: 0));
      _playerNameController.clear();
      _selectedAvatar = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Set Players'),
      ),
      body: Center(
        child: SizedBox(
          width: 600,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // Show existing players
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (var player in _players)
                    Column(
                      children: [
                        Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                            shape: BoxShape.rectangle,
                            border: Border.all(
                              color: Colors.black,
                              width: 2.0,
                            ),
                            image: DecorationImage(
                              image: AssetImage(player.avatar),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          player.name,
                          style: title,
                        ),
                      ],
                    ),
                ],
              ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  DropdownButton<String>(
                    hint: Text('Select avatar'),
                    menuMaxHeight: 400,
                    value: _selectedAvatar,
                    items: _avatars.map((avatar) {
                      return DropdownMenuItem(
                        value: avatar,
                        child: Center(child:Image.asset(avatar))
                      );
                    }).toList(),
                    onChanged: (avatar) {
                      setState(() {
                        _selectedAvatar = avatar;
                      });
                    },
                  ),
                  TextField(
                    controller: _playerNameController,
                    onChanged: (_) {
                      setState(() {
                        _selectedName = _playerNameController.text;
                      });
                    },
                    decoration: InputDecoration(labelText: 'Nombre del Jugador'),
                  ),
                  ElevatedButton(
                    child: Text('Añadir Jugador'),
                    onPressed: _selectedAvatar != null && _playerNameController.text.isNotEmpty ? () {
                      setState(() {// We add the player to the list of players
                        addPlayer(_playerNameController.text, _selectedAvatar!);
                        // Clear the text field and avatar selection
                        _playerNameController.clear();
                        _selectedAvatar = null;
                      });
                    }
                    : null, // Disable the button if the avatar isn't selected or the text field is empty
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    child: Text('Start Game'),
                    onPressed: _players.length >= 2 ? () {
                      _players.add(Player(name: "Ignorance", avatar: "lib/src/assets/patrick.jpg"));
                      // Navigate to the game screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChangeNotifierProvider(
                            create: (context) => GameProvider(
                              gameService: GameService(_players),
                              questionService: QuestionService(),
                            ),
                            child: GamePage(),
                          ),
                        ),
                      );
                    }
                    : null, // Disable the button if there are less than two players
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
