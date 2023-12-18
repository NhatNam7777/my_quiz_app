import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue.shade200, Colors.pink.shade200],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Opacity(
              opacity: 0.8,
              child: Image.asset('lib/assets/images/quiz-logo.png')),
          const SizedBox(
            height: 30,
          ),
          const Text(
            'Test your brain',
            style: TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontFamily: 'Preahvihear',
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          TextButton.icon(
            onPressed: () {},
            label: const Text(
              'Start Challenge',
            ),
            icon: const Icon(
              Icons.schedule_rounded,
            ),
            style: TextButton.styleFrom(
              foregroundColor: Colors.red,
              backgroundColor: Colors.blue.shade200,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              textStyle:
                  const TextStyle(fontSize: 15, fontFamily: 'Preahvihear'),
            ),
          )
        ],
      ),
    );
  }
}
