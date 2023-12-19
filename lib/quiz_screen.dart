import 'package:flutter/material.dart';
import 'package:my_quiz/data/question_data.dart';
import 'package:my_quiz/answer_box.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

int currentIndexQuestion = 0;

class _QuizScreenState extends State<QuizScreen> {
  @override
  Widget build(BuildContext context) {
    void nextQuestion() {
      setState(() {
        currentIndexQuestion++;
      });
    }

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            questions[currentIndexQuestion].question + '?',
            style: const TextStyle(fontSize: 20, color: Color(0xff3b74ae)),
          ),
          const SizedBox(
            height: 20,
          ),
          ...questions[currentIndexQuestion].answer.map((e) {
            return AnswerBox(
              answer: e,
              nextQuestion: nextQuestion,
            );
          })
        ],
      ),
    );
  }
}
