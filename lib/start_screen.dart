import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key, required this.onStart});

  final VoidCallback onStart;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.quiz_outlined, size: 200, color: Colors.white70),
          const SizedBox(height: 60),
          const Text(
            'Nauč sa Flutter zábavnou formou!',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          const SizedBox(height: 30),
          OutlinedButton.icon(
            onPressed: onStart,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              side: const BorderSide(color: Colors.white70),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
              textStyle: const TextStyle(fontSize: 18),
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text('Spustiť kvíz'),
          ),
        ],
      ),
    );
  }
}
