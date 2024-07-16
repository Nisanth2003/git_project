import 'package:flutter/material.dart';
import 'dart:math';
import 'gradient_container.dart';
import 'styled_text.dart';
import 'image_build.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DiceGame(),
    );
  }
}

class DiceGame extends StatefulWidget {
  @override
  _DiceGameState createState() => _DiceGameState();
}

class _DiceGameState extends State<DiceGame> {
  int player1Score = 0;
  int player2Score = 0;
  int player1DiceNumber = 1;
  int player2DiceNumber = 1;
  bool isPlayer1Turn = true;
  String winner = '';

  void rollDice() {
    if (winner.isNotEmpty) return;

    setState(() {
      if (isPlayer1Turn) {
        player1DiceNumber = Random().nextInt(6) + 1;
        player1Score += player1DiceNumber;
        if (player1Score >= 20) {
          winner = 'Player 1 Wins!';
        }
      } else {
        player2DiceNumber = Random().nextInt(6) + 1;
        player2Score += player2DiceNumber;
        if (player2Score >= 20) {
          winner = 'Player 2 Wins!';
        }
      }
      isPlayer1Turn = !isPlayer1Turn;
    });
  }

  void resetGame() {
    setState(() {
      player1Score = 0;
      player2Score = 0;
      player1DiceNumber = 1;
      player2DiceNumber = 1;
      isPlayer1Turn = true;
      winner = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Dice Game'),
      ),
      body: GradientContainer(
        colors: [Colors.blue, Colors.purple],
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (winner.isNotEmpty) StyledText(text: winner),
              if (winner.isEmpty) StyledText(text: 'Player ${isPlayer1Turn ? '1' : '2'}\'s Turn'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      DiceImage(diceNumber: player1DiceNumber),
                      StyledText(text: 'Player 1 Score: $player1Score'),
                    ],
                  ),
                  Column(
                    children: [
                      DiceImage(diceNumber: player2DiceNumber),
                      StyledText(text: 'Player 2 Score: $player2Score'),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: rollDice,
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(Colors.red),
                  foregroundColor: WidgetStateProperty.all<Color>(Colors.black),
                ),
                child: StyledText(text: 'Roll Dice'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: resetGame,
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(Colors.red),
                  foregroundColor: WidgetStateProperty.all<Color>(Colors.black),
                ),
                child: StyledText(text: 'Reset Game'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
