import 'package:flutter/material.dart';

class BrandingText extends StatelessWidget {
  const BrandingText({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 73,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Your Personal",
            style: TextStyle(
              fontFamily: 'Gilroy-Medium',
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
          Text(
            "Fashion Designer",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 22,
            ),
          ),
        ],
      ),
    );
  }
}
