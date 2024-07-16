import 'package:flutter/material.dart';

class Start_Screen extends StatelessWidget {
  final Function(int) toggle;
  const Start_Screen({required this.toggle, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage("assets/images/quizIcon.png"),
                width: 200,
                height: 200,
              ),
              const SizedBox(height: 20),
              const Text(
                "Welcome to the",
                style: TextStyle(fontSize: 18, color: Colors.white70),
              ),
              const Text(
                "Quiz App",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const Text(
                "A fun way to test your knowledge",
                style: TextStyle(fontSize: 20, color: Colors.white70),
              ),
              const SizedBox(height: 100),
              ElevatedButton(
                onPressed: () {
                  toggle(2);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15)),
                child: const Text(
                  'Start Quiz',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(height: 20),
            
            ],
          ),
        ),
      ),
    );
  }
}
