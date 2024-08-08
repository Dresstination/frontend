import 'package:flutter/material.dart';

class BrandingText extends StatelessWidget {
  const BrandingText({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 75,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Your Personal",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 26,
            ),
          ),
          Text(
            "Fashion Designer",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 26,
            ),
          ),
        ],
      ),
    );
  }
}
