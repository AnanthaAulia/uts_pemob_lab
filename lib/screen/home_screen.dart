import 'package:flutter/material.dart';
import 'package:uts_pemob_lab/screen/quiz_screen.dart';

class home_screen extends StatefulWidget {
  const home_screen({super.key});

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFCD8B62),
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

            // Input Username
            SizedBox(
              width: 200,
              child: TextField(
                controller: _nameController,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: "Masukkan Nama",
                  filled: true,
                  fillColor: const Color(0xFFEED7A1), // <-- Warna background input
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12), // sudut melengkung
                    borderSide: BorderSide.none, // hilangkan garis border
                  ),
                ),
              ),
            ),


            const SizedBox(height: 20),

            // Tombol Mulai
            SizedBox(
              width: 150,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  String username = _nameController.text.trim();

                  if (username.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Nama tidak boleh kosong")),
                    );
                    return;
                  }

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => quiz_screen(username: username),
                    ),
                  );
                },
                child: const Text("Mulai"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
