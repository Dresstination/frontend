import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class BrandingText extends StatelessWidget {
  const BrandingText({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 73,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DefaultTextStyle(
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 26.47,
                height: 32.71 / 26.47,
                color: Colors.white.withOpacity(0.8)),
            child: AnimatedTextKit(
              isRepeatingAnimation: false,
              totalRepeatCount: 1,
              animatedTexts: [
                WavyAnimatedText(
                  speed: Duration(milliseconds: 180),
                  "Your Personal",
                ),
              ],
            ),
          ),
          AnimatedTextKit(
            isRepeatingAnimation: false,
            totalRepeatCount: 1,
            animatedTexts: [
              TyperAnimatedText(
                speed: const Duration(milliseconds: 600),
                "Fashion Designer",
                textStyle: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 26.47,
                    height: 32.71 / 26.47,
                    color: Colors.white.withOpacity(0.9)),
              )
            ],
          ),
        ],
      ),
    );
  }
}
