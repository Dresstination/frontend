import 'package:dresti_frontend/styles/styles.dart';
import 'package:flutter/material.dart';

class BrandingText extends StatelessWidget {
  const BrandingText({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Your Personal",
            style: Styles.customTextStyle('fontSize_26', 'fontWeight_400',
                color: Colors.white.withOpacity(0.8)),
          ),
          Text(
            "Fashion Designer",
            style: Styles.customTextStyle('fontSize_26', 'fontWeight_700',
                color: Colors.white.withOpacity(0.9)),
          )
        ],
      ),
    );
  }
}
