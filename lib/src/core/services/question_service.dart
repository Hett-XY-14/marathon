
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/question_model.dart';
import 'package:marathon/src/core/utils/math_utils.dart';

class QuestionService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final List<Question> questions = [];
  Question? currentQuestion;

  Future<List<Question>> fetchQuestions(String category) async {
    try {
      final questionsSnapshot = await _db.collection('questions').get();
      print("Questions successfully retrieved");

      for (var question in questionsSnapshot.docs) {
        questions.add(
          Question(
            questionText: question['question'],
            correctAnswer: question.data()['correctAnswer'],
            answers: List<String>.from(question.data()['answers']),
          ),
        );
      }

      return questions;
    } catch (error) {
      print("Error retrieving questions: $error");
      return []; // Return an empty list in case of an error
    }
  }

  Question? getNextQuestion() {
    int randomIndex = getRandomNumber(0,questions.length);
    currentQuestion = questions.removeAt(randomIndex);
    return currentQuestion;
  }

  Question? getCurrentQuestion() {
    return currentQuestion;
  }

  bool checkAnswer(int answer) {
    return currentQuestion?.correctAnswer == answer ? true : false;
  }

  bool isGameOver() {
    if(questions.isEmpty) return true;
    return false;
  }

}
