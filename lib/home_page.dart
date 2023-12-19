import 'package:flutter/material.dart';
import 'package:my_quiz/quiz_screen.dart';
import 'package:my_quiz/start_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

String activeTag = 'start_screen';

class _HomePageState extends State<HomePage> {
  void switchScreen() {
    setState(() {
      activeTag = 'quiz_screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activeScreen = StartScreen(switchScreen: switchScreen);
    if (activeTag == 'quiz_screen') activeScreen = QuizScreen();
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
