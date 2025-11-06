import 'package:flutter/material.dart';
import 'home_screen.dart';

class ResultScreen extends StatelessWidget {
  final int score;
  final int total;
  final String username;

  const ResultScreen({
    super.key,
    required this.score,
    required this.total,
    required this.username,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFCD8B62),
      appBar: AppBar(title: const Text("Hasil Kuis"),
      backgroundColor: const Color(0xFFCD8B62),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Selamat $username!",
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              "Nilai Kamu: $score / $total",
              style: const TextStyle(fontSize: 28),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: 200,
              height: 70,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const home_screen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  alignment: Alignment.center,
                  textStyle: const TextStyle(
                    fontSize: 20, // ukuran teks
                    fontWeight: FontWeight.w600,
                  ),
                ),
                child: const Text(
                  "Kembali ke Beranda",
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
