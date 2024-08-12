import 'package:dresti_frontend/src/widgets/expandviewScreen/quick_link_button.dart';
import 'package:dresti_frontend/styles/styles.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String imgUrl;
  final String description;
  final String link;
  final double price;
  const ProductCard(
      {super.key,
      required this.imgUrl,
      required this.description,
      required this.link,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 156,
        height: 181,
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          image: DecorationImage(
              opacity: 0.6,
              image: AssetImage(
                imgUrl,
              ),
              fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              bottom: 0,
              left: 10,
              right: 0,
              top: 90,
              child: Container(
                height: 78,
                width: 136,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(description,
                        style: Styles.customTextStyle(
                            'fontSize_14', 'fontWeight_600',
                            color: const Color(0xffFFFFFF).withOpacity(0.9))),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text("₹ $price",
                            style: Styles.customTextStyle(
                                'fontSize_18', 'fontWeight_700',
                                color:
                                    const Color(0xffFFFFFF).withOpacity(0.9))),
                        const SizedBox(
                          width: 10,
                        ),
                        const QuickLinkButton(
                          iconUrl: "assets/images/grid-icon3.svg",
                          index: 0,
                          link: "",
                          h: 26,
                          w: 28,
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
