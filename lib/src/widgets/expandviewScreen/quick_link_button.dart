import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class QuickLinkButton extends StatelessWidget {
  final String iconUrl;
  final String imgURL;
  final String dress;
  final int index;
  final double h;
  final double w;
  const QuickLinkButton({
    super.key,
    required this.iconUrl,
    required this.index,
    this.h = 42,
    this.w = 34,
    required this.imgURL,
    required this.dress,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        if (index == 0) {
          await launchUrl(
              Uri.parse("https://lens.google.com/uploadbyurl?url=$imgURL"));
        } else if (index == 1) {
          await launchUrl(Uri.parse("https://www.walmart.com/search?q=$dress"));
        } else if (index == 2) {
          await launchUrl(Uri.parse("https://www.amazon.in/s?k=$dress"));
        } else {
          await launchUrl(
              Uri.parse("https://www.flipkart.com/search?q=$dress"));
        }
      },
      child: Container(
          width: w,
          height: h,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.10), // Container color
            borderRadius:
                BorderRadius.circular(22), // Radius for rounded corners
          ),
          margin: EdgeInsets.only(right: 8), // Spacing between containers
          child:
              Center(child: SvgPicture.asset(iconUrl, height: 18, width: 18))),
    );
  }
}
