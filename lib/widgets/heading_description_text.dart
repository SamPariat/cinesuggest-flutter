import 'package:flutter/material.dart';

class HeadingDescription extends StatelessWidget {
  final String text;

  const HeadingDescription({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
