import 'package:flutter/material.dart';

import 'data/questions.dart';
import 'questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
    required this.onRestart,
  });

  final List<String> chosenAnswers;
  final VoidCallback onRestart;

  List<QuestionResult> get _results {
    return chosenAnswers.indexed.map((entry) {
      final (index, chosenAnswer) = entry;
      final question = questions[index];

      return (
        number: index + 1,
        question: question.text,
        correctAnswer: question.correctAnswer,
        chosenAnswer: chosenAnswer,
        isCorrect: chosenAnswer == question.correctAnswer,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final results = _results;
    final correctCount = results.where((result) => result.isCorrect).length;

    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        children: [
          Text(
            'Správne odpovede: $correctCount z ${questions.length}',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          Expanded(child: QuestionsSummary(results)),
          const SizedBox(height: 30),
          TextButton.icon(
            onPressed: onRestart,
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              textStyle: const TextStyle(fontSize: 18),
            ),
            icon: const Icon(Icons.refresh),
            label: const Text('Reštartovať kvíz'),
          ),
        ],
      ),
    );
  }
}
