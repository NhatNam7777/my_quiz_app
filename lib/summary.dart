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
                      width: 25,
                    ),
                    Container(
                      height: 30,
                      width: 30,
                      margin: const EdgeInsets.only(top: 3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: e['user_answer'] == e['correct_answer']
                            ? Colors.green.shade500
                            : Colors.red.shade600,
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
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            e['question'] as String,
                            style: const TextStyle(
                              color: Color(0xffF6FA70),
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            e['correct_answer'] as String,
                            style: const TextStyle(
                              color: Color(0xff00C4FF),
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            e['user_answer'] as String,
                            style: const TextStyle(
                              color: Color(0xffF6BA6F),
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
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
