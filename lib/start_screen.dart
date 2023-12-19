import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({
    super.key,
    required this.switchScreen,
  });

  final void Function() switchScreen;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Opacity(
            opacity: 0.5,
            child: Image.asset(
              'lib/assets/images/quiz-logo.png',
              width: width * 0.7,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            'Tìm nhà hiền triết',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontFamily: 'Preahvihear',
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 30,
          ),
          TextButton.icon(
            onPressed: switchScreen,
            label: const Text(
              'Kiểm tra',
            ),
            icon: const Icon(
              Icons.remove_red_eye_outlined,
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
