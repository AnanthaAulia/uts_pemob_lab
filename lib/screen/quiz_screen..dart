import 'package:flutter/material.dart';
import 'result_screen.dart';
import 'package:uts_pemob_lab/widget/question_widget.dart';

class quiz_screen extends StatefulWidget {
  const quiz_screen({super.key});

  @override
  State<quiz_screen> createState() => quiz_screenState();
}

class quiz_screenState extends State<quiz_screen> {
  int currentQuestion = 0;

  List<int?> userAnswers = [];

  @override
  void initState() {
    super.initState();
    userAnswers = List<int?>.filled(questions.length, null);
  }

  final List<Map<String, dynamic>> questions = [
    {
      "question": "Ibukota Indonesia adalah?",
      "answers": ["Jakarta", "Bandung", "Surabaya", "Medan"],
      "correct": 0
    },
    {
      "question": "2 + 3 = ?",
      "answers": ["3", "5", "8", "1"],
      "correct": 1
    },
    {
      "question": "Warna bendera Indonesia?",
      "answers": ["Hijau Putih", "Merah Putih", "Biru Kuning", "Hitam Putih"],
      "correct": 1
    }
  ];

  void answerQuestion(int selectedIndex) {
    setState(() {
      userAnswers[currentQuestion] = selectedIndex;
    });

    if (currentQuestion < questions.length - 1) {
      setState(() {
        currentQuestion++;
      });
    } else {
      int score = 0;
      for (int i = 0; i < questions.length; i++) {
        if (userAnswers[i] == questions[i]["correct"]) {
          score++;
        }
      }

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(score: score, total: questions.length),
        ),
      );
    }
  }

  Future<bool> handleBack() async {
    if (currentQuestion > 0) {
      setState(() {
        currentQuestion--;
      });
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    var q = questions[currentQuestion];

    return WillPopScope(   // <--- Mendeteksi tombol back / ikon back
      onWillPop: handleBack,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Soal ${currentQuestion + 1} / ${questions.length}"),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: handleBack,
          ),
          backgroundColor: Color(0xFFCD8B62),
        ),
        backgroundColor: const Color(0xFFCD8B62),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: question_widget(
            question: q["question"],
            answers: List<String>.from(q["answers"]),
            onAnswerSelected: answerQuestion,
          ),
        ),
      ),
    );
  }
}
