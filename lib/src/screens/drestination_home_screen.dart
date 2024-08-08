import 'package:dresti_frontend/src/widgets/initScreen/branding_text_widget.dart';
import 'package:dresti_frontend/src/widgets/initScreen/primary_action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DrestinationHome extends StatelessWidget {
  const DrestinationHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 2,
                color: const Color(0xff4E2FCB),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 2,
                color: Colors.black,
              ),
            ],
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 2 - 290,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.topCenter,
              child: SvgPicture.asset(
                "assets/images/Group 35.svg",
                width: 230,
                height: 347,
              ),
            ),
          ),
          Positioned(
              left: 0,
              right: 0,
              top: MediaQuery.of(context).size.height / 2 + 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const BrandingText(),
                  Container(
                    height: 56,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 39, vertical: 24),
                    child: Text(
                        "Lorem ipsum dolor sit amet consectetur. Vulputate nibh eu cras adipiscing ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.white.withOpacity(0.7))),
                  ),
                  const PrimaryActionButton()
                ],
              )),
        ],
      ),
    );
  }
}
