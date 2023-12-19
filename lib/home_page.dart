import 'package:flutter/material.dart';
import 'package:my_quiz/quiz_screen.dart';
import 'package:my_quiz/results_screen.dart';
import 'package:my_quiz/start_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

String activeTag = 'start_screen';

class _HomePageState extends State<HomePage> {
  void switchToQuizScreen() {
    setState(() {
      activeTag = 'quiz_screen';
    });
  }

  void switchToResultsScreen() {
    setState(() {
      activeTag = 'results_screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activeScreen = StartScreen(switchScreen: switchToQuizScreen);
    if (activeTag == 'quiz_screen') {
      activeScreen = QuizScreen(switchScreen: switchToResultsScreen);
    }
    if (activeTag == 'results_screen') activeScreen = const ResultsScreen();
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade200, Colors.pink.shade200],
          ),
        ),
        child: activeScreen,
      ),
    );
  }
}
