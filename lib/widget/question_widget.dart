import 'package:flutter/material.dart';

class question_widget extends StatelessWidget {
  final String question;
  final List<String> answers;
  final Function(int) onAnswerSelected;

  const question_widget({
    super.key,
    required this.question,
    required this.answers,
    required this.onAnswerSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          question,
          style: const TextStyle(fontSize: 22),
        ),
        const SizedBox(height: 20),

        // Generate pilihan jawaban
        for (int i = 0; i < answers.length; i++)
          ElevatedButton(
            onPressed: () => onAnswerSelected(i),
            child: Text(answers[i]),
          ),
      ],
    );
  }
}
