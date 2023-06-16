import '../model/quiz_model.dart';

class QuizRepository {
  final List<Question> questions;

  QuizRepository(this.questions);

  List<Question> getQuestions() {
    return questions;
  }
}
