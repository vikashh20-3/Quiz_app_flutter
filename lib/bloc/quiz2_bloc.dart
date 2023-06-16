import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/quiz2_model.dart';

class Quiz2Bloc extends Cubit<int> {
  final List<Question2> questions;
  int totalScore = 0;
  int questionIndex = 0;
  List<Question2> skippedQuestions = [];

  Quiz2Bloc(this.questions) : super(0);

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
