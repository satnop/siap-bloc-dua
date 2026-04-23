import 'package:flutter/material.dart';

class TokenHabis extends StatelessWidget {
  final String title;
  final String content;
  final String buttonText;

  const TokenHabis({
    super.key,
    required this.title,
    required this.content,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        style: const TextStyle(fontSize: 15.0),
      ),
      content: Text(
        content,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      actions: [
        TextButton(
          child: Text(buttonText),
          onPressed: () {
            // Navigator.pushReplacement(
            //     context,
            //     MaterialPageRoute(
            //         builder: (BuildContext context) => const LoginPage()));
          },
        ),
      ],
    );
  }
}
