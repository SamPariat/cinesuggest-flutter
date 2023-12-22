import 'package:flutter/material.dart';

class HeadingText extends StatelessWidget {
  final String text;

  const HeadingText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 50,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
