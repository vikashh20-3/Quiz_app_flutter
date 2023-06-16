import 'package:bloc/bloc.dart';

import '../model/quiz_model.dart';

class QuizBloc extends Cubit<int> {
  final List<Question> questions;
  int totalScore = 0;
  int questionIndex = 0;
  List<Question> skippedQuestions = [];

  QuizBloc(this.questions) : super(0);

  void answerQuestion(int score) {
    totalScore += score;
    questionIndex++;

    if (questionIndex >= questions.length) {
      // Quiz completed, show the result
      emit(totalScore);
    } else {
      emit(questionIndex);
    }
  }

  void resetQuiz() {
    totalScore = 0;
    questionIndex = 0;
    skippedQuestions.clear();
    emit(questionIndex);
  }

  void skipQuestion() {
    skippedQuestions.add(questions[questionIndex]);
    questionIndex++;

    if (questionIndex >= questions.length) {
      // Quiz completed, show the result
      emit(totalScore);
    } else {
      emit(questionIndex);
    }
  }

  void previousQuestion() {
    questionIndex--;

    if (questionIndex < 0) {
      questionIndex = 0;
    }

    emit(questionIndex);
  }
}
