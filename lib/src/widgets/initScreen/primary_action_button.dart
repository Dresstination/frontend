import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PrimaryActionButton extends StatelessWidget {
  const PrimaryActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
      child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(338, 54),
            backgroundColor: const Color(0xffffffff),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2.0),
            ),
          ),
          onPressed: () {},
          icon: SvgPicture.asset("assets/images/Google.svg"),
          label: const Text(
            "GET STARTED",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          )),
    );
  }
}
