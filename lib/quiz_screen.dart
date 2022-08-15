import 'package:flutter/material.dart';
import 'package:quiz_app/components/quiz.dart';
import 'package:quiz_app/components/result.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _questionIndex = 0;
  int _questionNumber = 1;
  int _totalScore = 0;

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return Dialogs(
          onPressed: () {
            Navigator.of(context).pop();
            setState(() {
              _questionIndex = 0;
              _questionNumber = _questionIndex + 1;
              _totalScore = 0;
            });
          },
          score: _totalScore,
        );
      },
    );
  }

  void _answersHandler(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex == _questions.length - 1
          ? _showMyDialog()
          : _questionIndex++;
      _questionNumber = _questionIndex + 1;
    });
    print(_totalScore);
  }

  static const _questions = [
    {
      'questionText': 'What is your name?',
      'answers': [
        {'text': 'Favour', 'score': 10},
        {'text': 'Wale', 'score': 10},
        {'text': 'Wole', 'score': 10},
        {'text': 'Seyi', 'score': 10},
      ],
    },
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Yellow', 'score': 5},
        {'text': 'Black', 'score': 5},
        {'text': 'Blue', 'score': 5},
        {'text': 'Red', 'score': 5},
        {'text': 'Pink', 'score': 5},
      ],
    },
    {
      'questionText': 'What\'s your best food?',
      'answers': [
        {'text': 'Beans', 'score': 5},
        {'text': 'Rice', 'score': 5},
        {'text': 'Yam', 'score': 5},
        {'text': 'Pounded Yam(Iyan)', 'score': 5},
      ],
    },
    {
      'questionText': 'How are you doing today?',
      'answers': [
        {'text': 'fine', 'score': 10},
        {'text': 'awesome', 'score': 10},
        {'text': 'Never been better', 'score': 10},
        {'text': 'Not so good', 'score': 2},
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
        ),
      ),
      body: Quiz(
        questions: _questions,
        questionNum: _questionNumber,
        totalQuestionsNum: _questions.length,
        questionIndex: _questionIndex,
        onPressedHandler: _answersHandler,
      ),
    );
  }
}
