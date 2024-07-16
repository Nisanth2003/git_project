import 'package:flutter/material.dart';
import 'mcq.dart';

class ResultPage extends StatefulWidget {
  final Map<int, int> answersMap;
  final List<Mcq> mcqsList;
  final Function(int) navigateToPage;

  const ResultPage({
    required this.answersMap,
    required this.navigateToPage,
    required this.mcqsList,
    super.key,
  });

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(40),
      child: Column(
        children: [
          const Center(
            child: Text(
              "Quiz Results",
              style: TextStyle(
                color: Color.fromARGB(255, 8, 144, 255),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ...widget.mcqsList.map((mcq) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text(
                  "${mcq.id}. ${mcq.question}",
                  style: const TextStyle(
                    color: Color.fromARGB(255, 8, 144, 255),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Correct Answer: ${mcq.options[mcq.correctOptionId]}",
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Your Answer: ${widget.answersMap[mcq.id] == null ? "Not Answered" : mcq.options[widget.answersMap[mcq.id] ?? 0]}",
                  style: TextStyle(
                    fontSize: 18,
                    color: mcq.correctOptionId == widget.answersMap[mcq.id] ? Colors.green : Colors.red,
                  ),
                ),
                const Divider(),
              ],
            );
          }).toList(),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              widget.navigateToPage(1);
              widget.answersMap.clear();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF000000),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
            ),
            child: const Text(
              'Restart Quiz',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
