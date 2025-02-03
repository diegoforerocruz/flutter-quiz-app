import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<StatefulWidget> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  String? activeScreen;
  List<String> selectedAnswer = [];

  @override
  void initState() {
    activeScreen = 'start-screen';
    super.initState();
  }

  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);

    if (selectedAnswer.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswer = [];

      activeScreen = 'questions-screen';
    });
  }

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.deepPurple,
        body: activeScreen == 'start-screen'
            ? StartScreen(switchScreen)
            : activeScreen != 'results-screen'
                ? Questions(onTapAnswer: chooseAnswer)
                : ResultsScreen(
                    selectedAnswer,
                    onRestart: restartQuiz,
                  ),
      ),
    );
  }
}
