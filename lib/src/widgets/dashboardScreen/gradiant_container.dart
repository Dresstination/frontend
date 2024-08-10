import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 393,
      height: 300,
      color: Colors.white,
      child: Align(
          alignment: Alignment.topCenter,
          child: Image.asset("assets/images/Group.jpg")),
    );
  }
}
