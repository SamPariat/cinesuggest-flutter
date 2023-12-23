import 'package:flutter/material.dart';

class ScreenImage extends StatelessWidget {
  final String imagePath;
  final double imageWidth;

  const ScreenImage({
    super.key,
    required this.imagePath,
    required this.imageWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage(
        imagePath,
      ),
      width: imageWidth,
    );
  }
}
