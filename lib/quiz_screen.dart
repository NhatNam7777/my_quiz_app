import 'package:flutter/material.dart';
import 'package:my_quiz/data/question_data.dart';
import 'package:my_quiz/answer_box.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({
    super.key,
    required this.switchScreen,
    required this.storeAnswers,
  });
  final void Function() switchScreen;
  final void Function(String answer) storeAnswers;

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentIndexQuestion = 0;
  int questionsLength = questions.length;

  @override
  Widget build(BuildContext context) {
    void nextQuestion() {
      setState(() {
        if (currentIndexQuestion < questionsLength - 1) {
          currentIndexQuestion++;
        } else {
          widget.switchScreen();
        }
      });
    }

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: Text(
              questions[currentIndexQuestion].question,
              style: const TextStyle(
                fontSize: 20,
                color: Color(0xffFFC436),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ...questions[currentIndexQuestion].shuffledAnswers.map((e) {
            return AnswerBox(
              answer: e,
              selectAnswer: () {
                nextQuestion();
                widget.storeAnswers(e);
              },
              switchScreen: widget.switchScreen,
            );
          })
        ],
      ),
    );
  }
}
