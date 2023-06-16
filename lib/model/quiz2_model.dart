class Answer2 {
  final String text;
  final int score;

  Answer2(this.text, this.score);
}

class Question2 {
  final String questionText;
  final List<Answer2> answers;

  Question2(this.questionText, this.answers);
}
