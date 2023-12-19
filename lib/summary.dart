import 'package:flutter/material.dart';

class Summary extends StatelessWidget {
  const Summary({
    super.key,
    required this.summary,
  });
  final List<Map<String, Object>> summary;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Column(
        children: [
          ...summary.map((e) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 30,
                  ),
                  Text(
                    (e['question_index'] as int).toString(),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Column(
                    children: [
                      Text(e['question'] as String),
                      Text(e['user_answer'] as String),
                      Text(e['correct_answer'] as String),
                    ],
                  )
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
