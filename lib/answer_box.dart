import 'package:flutter/material.dart';

class AnswerBox extends StatelessWidget {
  const AnswerBox({
    super.key,
    required this.answer,
    required this.selectAnswer,
    required this.switchScreen,
  });
  final String answer;
  final void Function() selectAnswer;
  final void Function() switchScreen;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.red.shade100,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          foregroundColor: const Color(0xff3b74ae),
          padding: EdgeInsets.only(left: 30),
        ),
        onPressed: selectAnswer,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            answer,
            textAlign: TextAlign.left,
          ),
        ),
      ),
    );
  }
}
