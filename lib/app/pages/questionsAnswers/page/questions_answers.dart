import 'package:flutter/material.dart';

class QuestionsAnswers extends StatelessWidget {
  static const name = '/questionsAnswers';
  const QuestionsAnswers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preguntas y respuestas'),
      ),
      body: const SafeArea(
        child: _QuestionsAnswersBody(),
      ),
    );
  }
}

class _QuestionsAnswersBody extends StatelessWidget {
  const _QuestionsAnswersBody();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text('Preguntas y respuestas'),
      ],
    );
  }
}
