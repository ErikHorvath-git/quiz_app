import 'package:flutter/material.dart';

import 'data/questions.dart';
import 'models/answer_button.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var _currentQuestionIndex = 0;

  void _answerQuestion(String answer) {
    widget.onSelectAnswer(answer);

    // Po poslednej odpovedi Quiz prepne na výsledky, takže tento index
    // sa už pri vykresľovaní nepoužije.
    setState(() {
      _currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[_currentQuestionIndex];

    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 12,
          children: [
            Text(
              'Otázka ${_currentQuestionIndex + 1} / ${questions.length}',
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white70, fontSize: 16),
            ),
            Text(
              currentQuestion.text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 18),
            ...currentQuestion.shuffledAnswers.map(
              (answer) =>
                  AnswerButton(answer, onTap: () => _answerQuestion(answer)),
            ),
          ],
        ),
      ),
    );
  }
}
