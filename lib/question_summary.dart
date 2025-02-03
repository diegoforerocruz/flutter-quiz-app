import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.questionsData, {super.key});

  final List<Map<String, Object>> questionsData;

  Color correctAnswerTheme(String a, String b) {
    if (a == b) {
      return Colors.greenAccent;
    } else {
      return Colors.redAccent;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: questionsData.map((item) {
            return Row(
              children: [
                Text(((item['question_index'] as int) + 1).toString()),
                Expanded(
                  child: Column(
                    children: [
                      Text((item['question']) as String),
                      Text(
                        (item['question_sel_answer']) as String,
                        style: TextStyle(
                          color: correctAnswerTheme(
                              item['question_sel_answer'] as String,
                              item['question_answer'] as String),
                        ),
                      ),
                      Text((item['question_answer']) as String,
                          style: TextStyle(
                            color: Colors.blueGrey,
                          )),
                    ],
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
