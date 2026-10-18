class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;

  // Prvá odpoveď v zozname je vždy správna.
  final List<String> answers;

  String get correctAnswer => answers.first;

  // Kópia zoznamu, aby sa pôvodné poradie (a správna odpoveď) nezmenilo.
  List<String> get shuffledAnswers => List.of(answers)..shuffle();
}
