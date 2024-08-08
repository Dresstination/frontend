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
          Text(
            "Your Personal",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 26.47,
                height: 32.71 / 26.47,
                color: Colors.white.withOpacity(0.8)),
          ),
          Text(
            "Fashion Designer",
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 26.47,
                height: 32.71 / 26.47,
                color: Colors.white.withOpacity(0.9)),
          ),
        ],
      ),
    );
  }
}
