// ignore: file_names
import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class Question extends StatelessWidget {
  const Question({
    required this.questionName,
    required this.questionNumber,
    required this.numOfQuestions,
  });

  final String questionName;
  final int questionNumber;
  final int numOfQuestions;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
              bottomLeft: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 5.0,
                offset: Offset(0, 5),
              ),
            ],
          ),
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.all(20),
          child: Stack(children: [
            closeCircle(align: Alignment.topLeft, degreeTurns: 90),
            closeCircle(align: Alignment.topRight, degreeTurns: 180),
            closeCircle(align: Alignment.bottomLeft, degreeTurns: 270),
            closeCircle(align: Alignment.bottomRight, degreeTurns: 360),
            Align(
              alignment: Alignment.center,
              child: NeumorphicText(
                style: const NeumorphicStyle(
                  depth: 2,
                  color: Colors.white,
                  shape: NeumorphicShape.concave,
                  oppositeShadowLightSource: true,
                  shadowLightColor: Colors.blue,
                ),
                questionName,
                textStyle: NeumorphicTextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ]),
        ),
        numberBubble(
          questionNumber: questionNumber,
          numOfQuestions: numOfQuestions,
        ),
      ],
    );
  }

  Align closeCircle({required Alignment align, required int degreeTurns}) {
    return Align(
      alignment: align,
      child: RotatedBox(
        quarterTurns: degreeTurns,
        child: NeumorphicIcon(
          CupertinoIcons.nosign,
          size: 25,
          style: const NeumorphicStyle(
            color: Colors.white,
            depth: 2,
            oppositeShadowLightSource: true,
          ),
        ),
      ),
    );
  }
}

class numberBubble extends StatelessWidget {
  const numberBubble({
    Key? key,
    required this.questionNumber,
    required this.numOfQuestions,
  }) : super(key: key);

  final int questionNumber;
  final int numOfQuestions;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding:
            const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
            bottomLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 5.0,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: NeumorphicText(
          '$questionNumber Of $numOfQuestions',
          style: const NeumorphicStyle(
            depth: 8,
            color: Colors.blue,
            shape: NeumorphicShape.concave,
          ),
          textStyle: NeumorphicTextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
