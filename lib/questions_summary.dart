import 'package:flutter/material.dart';

typedef QuestionResult = ({
  int number,
  String question,
  String correctAnswer,
  String chosenAnswer,
  bool isCorrect,
});

const _correctColor = Color(0xFF80FFDB);
const _wrongColor = Color(0xFFFF8FAB);

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.results, {super.key});

  final List<QuestionResult> results;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: results.map((result) => _SummaryItem(result)).toList(),
      ),
    );
  }
}

class _SummaryItem extends StatelessWidget {
  const _SummaryItem(this.result);

  final QuestionResult result;

  @override
  Widget build(BuildContext context) {
    final resultColor = result.isCorrect ? _correctColor : _wrongColor;

    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 16,
            backgroundColor: resultColor,
            child: Text(
              '${result.number}',
              style: const TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  result.question,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Tvoja odpoveď: ${result.chosenAnswer}',
                  style: TextStyle(color: resultColor),
                ),
                Text(
                  'Správna odpoveď: ${result.correctAnswer}',
                  style: const TextStyle(color: _correctColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
