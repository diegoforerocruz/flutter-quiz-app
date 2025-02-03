import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/question_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(this.choseAnswers, {super.key, required this.onRestart});

  final List<String> choseAnswers;

  final void Function() onRestart;

  List<Map<String, Object>> getSummaryData() {
    List<Map<String, Object>> summary = [];

    for (var i = 0; i < choseAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'question_sel_answer': choseAnswers[i],
        'question_answer': questions[i].answers[0]
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final totlalQuestions = questions.length;
    final correctAnswers = summaryData.where((data) {
      return data['question_sel_answer'] == data['question_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You got $correctAnswers of $totlalQuestions questions'),
            SizedBox(
              height: 30,
            ),
            QuestionSummary(getSummaryData()),
            SizedBox(
              height: 30,
            ),
            TextButton(
              style: ElevatedButton.styleFrom(foregroundColor: Colors.white),
              onPressed: onRestart,
              child: Text('restart quiz'),
            )
          ],
        ),
      ),
    );
  }
}
