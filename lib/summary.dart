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
      child: SingleChildScrollView(
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
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: e['user_answer'] == e['correct_answer']
                            ? Colors.green.shade400
                            : Colors.red.shade300,
                      ),
                      child: Center(
                        child: Text(
                          (e['question_index'] as int).toString(),
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          e['question'] as String,
                          style: const TextStyle(
                              color: Color(0xffe16a20),
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          e['correct_answer'] as String,
                          style: const TextStyle(
                            color: Color(0xff1592e6),
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          e['user_answer'] as String,
                          style: const TextStyle(
                            color: Color(0xffd63bf1),
                            fontSize: 15,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
