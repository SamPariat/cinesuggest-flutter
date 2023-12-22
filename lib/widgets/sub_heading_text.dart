import 'package:flutter/material.dart';

class SubHeadingText extends StatelessWidget {
  final String text;

  const SubHeadingText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 40,
        fontWeight: FontWeight.w700,
      ),
      textAlign: TextAlign.left,
    );
  }
}
