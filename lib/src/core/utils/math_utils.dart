import 'dart:math';

int getRandomNumber(int min, int max) {
  Random random = Random();
  int randomNumber = min + random.nextInt(max - min + 1);
  return randomNumber;
}