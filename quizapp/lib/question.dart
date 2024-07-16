import 'package:flutter/material.dart';
import 'mcq.dart';

class QuizQuestion extends StatefulWidget {
  final Mcq question;
  final Function(int, int) onAnswer;

  const QuizQuestion({super.key, required this.question, required this.onAnswer});

  @override
  _QuizQuestionState createState() => _QuizQuestionState();
}

class _QuizQuestionState extends State<QuizQuestion> {
  String _selectedOption = "";

  void _answerQuestion(int index) {
    setState(() {
      _selectedOption = widget.question.options[index];
    });
    widget.onAnswer(widget.question.id, index);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${widget.question.id}. ${widget.question.question}",
          style: const TextStyle(
            color: Color.fromARGB(255, 8, 144, 255),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        ...widget.question.options.asMap().entries.map((entry) {
          int idx = entry.key;
          String option = entry.value;
          return ListTile(
            title: Text(option),
            leading: Radio<String>(
              value: option,
              groupValue: _selectedOption,
              onChanged: (String? value) {
                _answerQuestion(idx);
              },
              activeColor: const Color.fromARGB(255, 33, 132, 193),
            ),
          );
        }).toList(),
      ],
    );
  }
}
