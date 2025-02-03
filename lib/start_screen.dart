import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/quiz-logo.png',
              width: 300, color: Color.fromARGB(150, 255, 255, 255)),
          SizedBox(
            height: 80,
          ),
          Text(
            'Learn FLutter the fun way!',
            style: TextStyle(
              fontSize: 15,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.deepPurple,
              foregroundColor: Colors.white,
            ),
            onPressed: startQuiz,
            icon: Icon(
              Icons.arrow_right_alt,
              color: Colors.white,
            ),
            label: Text(
              'Start Quiz',
            ),
          )
        ],
      ),
    );
  }
}
