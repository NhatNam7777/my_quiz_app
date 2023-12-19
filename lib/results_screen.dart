import 'package:flutter/material.dart';
import 'package:my_quiz/data/question_data.dart';
import 'package:my_quiz/summary.dart';

class ResultsScreen extends StatelessWidget {
  ResultsScreen({
    super.key,
    required this.chosenAnswer,
    required this.resetQuiz,
  });
  final List<String> chosenAnswer;
  final List<Map<String, Object>> summary = [];
  final void Function() resetQuiz;
  List<Map<String, Object>> getSummary() {
    for (var i = 0; i < questions.length; i++) {
      summary.add({
        'question_index': i + 1,
        'question': questions[i].question,
        'user_answer': chosenAnswer[i],
        'correct_answer': questions[i].answers[0],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final subSum = getSummary();
    final correctAnswerNum = subSum.where((element) {
      return element['user_answer'] == element['correct_answer'];
    }).length;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
              'You answered $correctAnswerNum out of ${questions.length} questions correctly!'),
          Summary(
            summary: subSum,
          ),
          TextButton(
            onPressed: resetQuiz,
            child: const Text('Reset Quiz'),
          ),
        ],
      ),
    );
  }
}
