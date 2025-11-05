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
      mainAxisAlignment: MainAxisAlignment.center, // ⬅ Tengah vertikal
      crossAxisAlignment: CrossAxisAlignment.center, // ⬅ Tengah horizontal
      children: [
        Text(
          question,
          textAlign: TextAlign.center, // ⬅ agar teksnya juga tengah
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 24),

        for (int i = 0; i < answers.length; i++) ...[
          SizedBox(
            width: 140,
            height: 70,
            child:
            ElevatedButton(
              onPressed: () => onAnswerSelected(i),
              style: ElevatedButton.styleFrom(
                alignment: Alignment.center, // <- memastikan teks center
              ),
              child: Text(
                answers[i],
                textAlign: TextAlign.center, // <- tambahan agar teks center
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16), // Jarak antar tombol
        ]
      ],
    );
  }
}
