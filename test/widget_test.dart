import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/quiz.dart';

void main() {
  testWidgets('kvíz prejde od štartu cez otázky k výsledkom a reštartu', (
    tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: Quiz()));

    expect(find.text('Spustiť kvíz'), findsOneWidget);
    await tester.tap(find.text('Spustiť kvíz'));
    await tester.pump();

    // Prvú otázku zodpovieme zle, ostatné správne.
    for (final (index, question) in questions.indexed) {
      expect(find.text(question.text), findsOneWidget);
      final answer = index == 0
          ? question.answers.last
          : question.correctAnswer;
      await tester.tap(find.text(answer));
      await tester.pump();
    }

    expect(
      find.text(
        'Správne odpovede: ${questions.length - 1} z ${questions.length}',
      ),
      findsOneWidget,
    );

    await tester.tap(find.text('Reštartovať kvíz'));
    await tester.pump();
    expect(find.text(questions.first.text), findsOneWidget);
  });
}
