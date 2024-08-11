import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class QuickLinkButton extends StatelessWidget {
  final String iconUrl;
  final int index;
  final double h;
  final double w;
  const QuickLinkButton({
    super.key,
    required this.iconUrl,
    required this.index,
    required link,
    this.h = 42,
    this.w = 34,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: w,
        height: h,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.10), // Container color
          borderRadius: BorderRadius.circular(22), // Radius for rounded corners
        ),
        margin: EdgeInsets.only(right: 8), // Spacing between containers
        child: Center(child: SvgPicture.asset(iconUrl, height: 18, width: 18)));
  }
}
