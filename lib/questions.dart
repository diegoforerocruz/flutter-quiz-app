import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';

class Questions extends StatefulWidget {
  const Questions({super.key, required this.onTapAnswer});

  final void Function(String answer) onTapAnswer;

  @override
  State<StatefulWidget> createState() {
    return _QuestionsState();
  }
}

class _QuestionsState extends State<Questions> {
  var currentIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onTapAnswer(selectedAnswer);
    setState(() {
      currentIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ...currentQuestion.getShuffledList().map((item) {
              return Answerbutton(
                textLabel: item,
                onTap: () {
                  answerQuestion(item);
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
