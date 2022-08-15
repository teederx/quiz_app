import 'package:flutter/material.dart';

class Answers extends StatelessWidget {
  const Answers({
    Key? key,
    required this.onPressedHandler,
    required this.buttonText,
  }) : super(key: key);

  final VoidCallback onPressedHandler;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            vertical: 15,
          ),
          elevation: 10,
        ),
        onPressed: onPressedHandler,
        child: Text(
          buttonText,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
