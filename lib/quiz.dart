import 'package:flutter/material.dart';

import 'data/questions.dart';
import 'questions_screen.dart';
import 'results_screen.dart';
import 'start_screen.dart';

enum _QuizScreen { start, questions, results }

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  final List<String> _selectedAnswers = [];
  var _activeScreen = _QuizScreen.start;

  void _startQuiz() {
    setState(() {
      _activeScreen = _QuizScreen.questions;
    });
  }

  void _chooseAnswer(String answer) {
    _selectedAnswers.add(answer);

    if (_selectedAnswers.length == questions.length) {
      setState(() {
        _activeScreen = _QuizScreen.results;
      });
    }
  }

  void _restartQuiz() {
    setState(() {
      _selectedAnswers.clear();
      _activeScreen = _QuizScreen.questions;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screen = switch (_activeScreen) {
      _QuizScreen.start => StartScreen(onStart: _startQuiz),
      _QuizScreen.questions => QuestionsScreen(onSelectAnswer: _chooseAnswer),
      _QuizScreen.results => ResultsScreen(
        chosenAnswers: _selectedAnswers,
        onRestart: _restartQuiz,
      ),
    };

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF3A0CA3), Color(0xFF7209B7)],
          ),
        ),
        child: SafeArea(child: screen),
      ),
    );
  }
}
