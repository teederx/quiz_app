import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class Dialogs extends StatelessWidget {
  const Dialogs({
    super.key,
    required this.onPressed,
    required this.score,
  });

  final VoidCallback onPressed;
  final int score;

  String get _remark {
    String remarkPhrase;
    score == 30
        ? remarkPhrase = 'It\'s a gift from God'
        : remarkPhrase = 'May God Help You';
    return remarkPhrase;
  }

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? AlertDialog(
            title: const Text('Congratulations!!'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(
                    _remark,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: onPressed,
                child: const Text('Thank you'),
              ),
            ],
          )
        : CupertinoAlertDialog(
            title: const Text('Congratulations!!'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(
                    _remark,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: onPressed,
                child: const Text('Thank you'),
              ),
            ],
          );
    ;
  }
}
