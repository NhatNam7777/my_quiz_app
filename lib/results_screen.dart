import 'package:flutter/material.dart';
import 'package:my_quiz/data/question_data.dart';
import 'package:my_quiz/summary.dart';
import 'package:google_fonts/google_fonts.dart';

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
            'You answered $correctAnswerNum out of ${questions.length} questions correctly!',
            style: GoogleFonts.rubikBubbles(
              fontSize: 20,
              color: Colors.pink,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 30,
          ),
          Summary(
            summary: subSum,
          ),
          TextButton.icon(
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            onPressed: resetQuiz,
            icon: Icon(Icons.refresh),
            label: const Text('Reset Quiz!'),
          ),
        ],
      ),
    );
  }
}
