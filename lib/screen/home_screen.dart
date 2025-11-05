import 'package:flutter/material.dart';
import 'package:uts_pemob_lab/screen/quiz_screen..dart';

class home_screen extends StatelessWidget {
  const home_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFCD8B62),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Selamat Datang di Quizmu!',
              style: TextStyle(fontSize: 28),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 150,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const quiz_screen()),
                  );
                },
                child: const Text('Mulai',
                  style: TextStyle(fontSize: 28),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
