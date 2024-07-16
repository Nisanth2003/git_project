import 'package:flutter/material.dart';
import 'mcq.dart';
import 'question.dart';

class SurveyPage extends StatefulWidget {
  final Function(int) toggle;
  final Function(int, int) answerQuestion;
  final List<Mcq> mcqs;

  const SurveyPage({
    required this.answerQuestion,
    required this.mcqs,
    required this.toggle,
    super.key,
  });

  @override
  State<SurveyPage> createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage> {
  int _currentQuestionIndex = 0;

  void _nextQuestion(int questionId, int answerIndex) {
    widget.answerQuestion(questionId, answerIndex);
    if (_currentQuestionIndex < widget.mcqs.length - 1) {
      setState(() {
        _currentQuestionIndex++;
      });
    } else {
      widget.toggle(3); // Go to the result page
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = widget.mcqs[_currentQuestionIndex];

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Survey"),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Survey Questions",
              style: TextStyle(
                color: Colors.black,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Please select the best answer.",
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 20),
            Card(
              elevation: 3,
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: QuizQuestion(
                  question: currentQuestion,
                  onAnswer: _nextQuestion,
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
