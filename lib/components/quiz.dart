import 'package:flutter/material.dart';
import 'package:quiz_app/components/answers.dart';
import 'package:quiz_app/components/question.dart';

class Quiz extends StatelessWidget {
  const Quiz({
    super.key,
    required this.questions,
    required this.questionNum,
    required this.totalQuestionsNum,
    required this.questionIndex,
    required this.onPressedHandler,
  });

  final List<Map<String, Object>> questions;
  final int questionNum;
  final int questionIndex;
  final int totalQuestionsNum;
  final Function? onPressedHandler;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: SizedBox(
            child: Question(
              questionName: questions[questionIndex]['questionText'] as String,
              questionNumber: questionNum,
              numOfQuestions: totalQuestionsNum,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          flex: 3,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //'...' Brings out each Answers() as a single item to be put in the list
                // '.map()' helps to create a List of Answer Widgets of each answers gotten from the Question List
                ...(questions[questionIndex]['answers']
                        as List<Map<String, Object>>)
                    .map((answer) => Answers(
                          onPressedHandler: () =>
                              onPressedHandler!(answer['score']),
                          buttonText: answer['text'] as String,
                        ))
                    .toList()
              ],
            ),
          ),
        ),
      ],
    );
  }
}
