class Answer {
  final String text;
  final int score;

  Answer(this.text, this.score);
}

class Question {
  final String questionText;
  final List<Answer> answers;

  Question(this.questionText, this.answers);
}
