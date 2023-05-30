class Player {
  final String name;
  int score;
  int position;
  String avatar;

  Player({
    required this.name,
    required this.avatar,
    this.score = 0,
    this.position=0,
  });
}
