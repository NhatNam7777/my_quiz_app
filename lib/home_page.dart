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

  void switchBackToStartScreen() {
    userAnswers = [];
    setState(() {
      activeTag = 'start_screen';
    });
  }

  List<String> userAnswers = [];

  void storeAnswers(String answer) {
    userAnswers.add(answer);
  }

  @override
  Widget build(BuildContext context) {
    Widget activeScreen = StartScreen(switchScreen: switchToQuizScreen);
    if (activeTag == 'quiz_screen') {
      activeScreen = QuizScreen(
        switchScreen: switchToResultsScreen,
        storeAnswers: storeAnswers,
      );
    }
    if (activeTag == 'results_screen') {
      activeScreen = ResultsScreen(
        chosenAnswer: userAnswers,
        resetQuiz: switchBackToStartScreen,
      );
    }
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff6D2C88), Color(0xffF6A776)],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: activeScreen,
      ),
    );
  }
}
