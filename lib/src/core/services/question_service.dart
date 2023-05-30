
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/question_model.dart';
import 'package:marathon/src/core/utils/math_utils.dart';

class QuestionService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  List<Question> questions = [];
  Question? currentQuestion;

  Future<List<Question>> fetchQuestions() async {
    try {
      var questionsSnapshot = await _db.collection('questions').get();
      print("Questions successfully retrieved");

      for (var question in questionsSnapshot.docs) {
        questions.add(
          Question(
            question: question.data()['question'],
            correctAnswer: question.data()['correctAnswer'],
            answers: List<String>.from(question.data()['answers']),
          ),
        );
        print(questions.length);
      }
      return questions;
    } catch (error) {
      print("Error retrieving questions: $error");
      return []; // Return an empty list in case of an error
    }
  }

  Question? getNextQuestion() {
    int randomIndex = getRandomNumber(0,questions.length);
    print(randomIndex);
    currentQuestion = questions.removeAt(randomIndex);
    print(currentQuestion?.question);
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
