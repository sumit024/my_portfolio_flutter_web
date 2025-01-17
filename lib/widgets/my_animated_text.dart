import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class MyAnimatedText extends StatelessWidget {
  final String text;
  final VoidCallback onAnimationFinished;

  const MyAnimatedText({
    required this.text,
    required this.onAnimationFinished,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      animatedTexts: [
        TypewriterAnimatedText(
          text,
          textStyle: const TextStyle(
            fontSize: 32,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          speed: const Duration(
            milliseconds: 100,
          ),
        ),
      ],
      totalRepeatCount: 1,
      displayFullTextOnTap: true,
      stopPauseOnTap: true,
      onFinished: () {
        onAnimationFinished();
      },
    );
  }
}
