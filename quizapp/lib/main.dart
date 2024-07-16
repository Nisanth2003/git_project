import 'package:flutter/material.dart';
import 'Result_Screen.dart';
import 'mcq.dart';
import 'Start_Screen.dart';
import 'quiz.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentScreen = 1;
   Map<int, int> answers = {};

  void _navigateTo(int screen) {
    setState(() {
      currentScreen = screen;
    });
  }

 
  void _recordAnswer(int questionId, int selectedOption) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        answers[questionId] = selectedOption;
      });
    });
  }

@override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Quiz App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 146, 111, 111),
        body: currentScreen == 1
            ? Start_Screen(
                toggle: _navigateTo
              )
            : currentScreen == 2
                ? SurveyPage(
                    mcqs: question,
                    answerQuestion: _recordAnswer,
                    toggle: _navigateTo,
                  )
                : ResultPage(
                    navigateToPage: _navigateTo,
                    answersMap : answers,
                    mcqsList: question,
                  ),
      ),
    );
  }
  List<Mcq> question = [
  Mcq(
    id: 1,
    question: "What is the esteemed purpose of the Eiffel Tower in Paris?",
    options: [
      "a) To serve as a monumental hat rack for the city",
      "b) To provide a dramatic backdrop for romantic proposals",
      "c) To function as a sophisticated antenna for French radio",
      "d) To act as a beacon for lost tourists seeking croissants",
    ],
    correctOptionId: 1,
  ),
  Mcq(
    id: 2,
    question: "What is the primary role of the Great Wall of China?",
    options: [
      "a) To offer a picturesque walking route for fitness enthusiasts",
      "b) To keep out unwelcome guests and nosy neighbors",
      "c) To serve as an ancient form of a tourist trap",
      "d) To showcase the prowess of ancient Chinese architecture",
    ],
    correctOptionId: 2,
  ),
  Mcq(
    id: 3,
    question: "What is the main ingredient in a traditional Caesar salad?",
    options: [
      "a) A sprinkle of Roman history",
      "b) A dollop of Julius Caesar's favorite dressing",
      "c) A handful of crunchy croutons",
      "d) A whisper of imperial grandeur",
    ],
    correctOptionId: 2,
  ),
  Mcq(
    id: 4,
    question: "Which famous physicist is known for his theory of relativity?",
    options: [
      "a) Isaac Newton, the grandmaster of gravity",
      "b) Nikola Tesla, the wizard of electric currents",
      "c) Albert Einstein, the maestro of space-time",
      "d) Stephen Hawking, the oracle of black holes",
    ],
    correctOptionId: 2,
  ),
  Mcq(
    id: 5,
    question: "What is the purpose of the Leaning Tower of Pisa?",
    options: [
      "a) To serve as an optical illusion artist's masterpiece",
      "b) To test the limits of architectural patience",
      "c) To attract tourists with its precarious tilt",
      "d) To act as a historical reminder to always check your foundation",
    ],
    correctOptionId: 2,
  ),
  Mcq(
    id: 6,
    question: "Which planet is known as the 'Red Planet'?",
    options: [
      "a) Venus, the planet of love",
      "b) Mars, the planet of war",
      "c) Jupiter, the giant protector",
      "d) Saturn, the ringed beauty",
    ],
    correctOptionId: 1,
  ),
  Mcq(
    id: 7,
    question: "What is the capital city of Australia?",
    options: [
      "a) Sydney, the city of sails",
      "b) Melbourne, the cultural capital",
      "c) Canberra, the political hub",
      "d) Brisbane, the river city",
    ],
    correctOptionId: 2,
  ),
  Mcq(
    id: 8,
    question: "What is the primary purpose of the Mona Lisa's enigmatic smile?",
    options: [
      "a) To intrigue art enthusiasts for centuries",
      "b) To conceal her secret identity",
      "c) To mock the onlookers' attempts at interpretation",
      "d) To serve as a timeless conversation starter",
    ],
    correctOptionId: 0,
  ),
  Mcq(
    id: 9,
    question: "Which element is known as the 'king of the jungle' in the periodic table?",
    options: [
      "a) Oxygen, the breath of life",
      "b) Gold, the element of riches",
      "c) Carbon, the backbone of all life",
      "d) Iron, the strong and mighty",
    ],
    correctOptionId: 2,
  ),
  Mcq(
    id: 10,
    question: "What is the purpose of a library in the digital age?",
    options: [
      "a) To serve as a sanctuary for book lovers",
      "b) To offer free Wi-Fi and a quiet workspace",
      "c) To preserve the ancient art of book sniffing",
      "d) To host epic battles of wits during quiz nights",
    ],
    correctOptionId: 1,
  ),
];


}