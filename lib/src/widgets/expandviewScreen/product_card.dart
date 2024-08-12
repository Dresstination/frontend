import 'package:dresti_frontend/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductCard extends StatelessWidget {
  final String imgUrl;
  final String title;
  final String link;
  final String price;
  const ProductCard(
      {super.key,
      required this.imgUrl,
      required this.title,
      required this.link,
      required this.price});

  String _truncateTitle(String title) {
    const int maxLength = 30;
    if (title.length > maxLength) {
      return '${title.substring(0, maxLength)}...';
    }
    return title;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        print(link);

        await launchUrl(Uri.parse(link));
      },
      child: Container(
          width: 156,
          height: 181,
          margin: const EdgeInsets.only(right: 16),
          decoration: BoxDecoration(
            image: DecorationImage(
                opacity: 0.6,
                image: NetworkImage(
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
                      Text(_truncateTitle(title),
                          style: Styles.customTextStyle(
                              'fontSize_14', 'fontWeight_600',
                              color: const Color(0xffFFFFFF).withOpacity(0.9))),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(price,
                              style: Styles.customTextStyle(
                                  'fontSize_18', 'fontWeight_700',
                                  color: const Color(0xffFFFFFF)
                                      .withOpacity(0.9))),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
