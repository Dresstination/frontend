import 'package:dresti_frontend/src/widgets/expandviewScreen/product_card.dart';
import 'package:dresti_frontend/src/widgets/expandviewScreen/quick_link_button.dart';
import 'package:dresti_frontend/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ExpandView extends StatelessWidget {
  final List<String> buttonData = [
    'assets/images/grid-icon1.svg',
    'assets/images/grid-icon2.svg',
    'assets/images/grid-icon3.svg',
    'assets/images/grid-icon4.svg',
  ];

  final List<Map<String, dynamic>> products = [
    {
      'imgUrl': 'assets/images/f-4.png',
      'description': 'FableStreet LivSoft Turtle Neck Sweater..',
      'link': 'https://example.com/product1',
      'price': 1250.0,
    },
    {
      'imgUrl': 'assets/images/f-3.png',
      'description': 'FableStreet ..',
      'link': 'https://example.com/product2',
      'price': 1500.0,
    },
    {
      'imgUrl': 'assets/images/f-1.png',
      'description': 'FableStreet LivSoft Turtle Neck Sweate...',
      'link': 'https://example.com/product3',
      'price': 1800.0,
    },
  ];

  ExpandView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 26),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 47),
              // color: Colors.red,
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset("assets/images/chevron-left.svg",
                        height: 32, width: 32),
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "A Cousin’s Wedding ",
                        style: Styles.customTextStyle(
                            'fontSize_18', 'fontWeight_600',
                            color: const Color(0xffF0F0F7)),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Aug 10, 2024",
                        style: Styles.customTextStyle(
                            'fontSize_14', 'fontWeight_400',
                            color: const Color(0xffFFFFFF).withOpacity(0.7)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 340,
              width: 340,
              margin: const EdgeInsets.symmetric(vertical: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.asset(
                "assets/images/expand.png",
                fit: BoxFit.fill,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              child: Text(
                "Floor-length wool velvet wrap dress",
                style: Styles.customTextStyle('fontSize_24', 'fontWeight_600',
                    color: const Color(0xffFFFFFF)),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 12),
              child: Text(
                "deep V-neck and long sleeves in burgundy, Midi-length cashmere sweater dress with cowl neck and side slit in charcoal grey",
                style: Styles.customTextStyle('fontSize_14', 'fontWeight_400',
                    color: const Color(0xffFFFFFF).withOpacity(0.7)),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 26),
              child: Text(
                "Quick Links",
                style: Styles.customTextStyle('fontSize_18', 'fontWeight_600',
                    color: const Color(0xffFFFFFF)),
              ),
            ),
            Container(
              width: 357,
              height: 35,
              margin: EdgeInsets.only(top: 13),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4, // Number of items
                itemBuilder: (context, index) {
                  // Sample link for demonstration

                  return QuickLinkButton(
                    index: index,
                    iconUrl: buttonData[index],
                    link: "",
                  );
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 37),
              child: Text(
                "Products",
                style: Styles.customTextStyle('fontSize_18', 'fontWeight_600',
                    color: const Color(0xffFFFFFF)),
              ),
            ),
            Container(
              height: 181,
              margin: const EdgeInsets.only(bottom: 45, top: 26),
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  final product = products[index];

                  return ProductCard(
                    imgUrl: product['imgUrl'],
                    description: product['description'],
                    link: product['link'],
                    price: product['price'],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    )));
  }
}


// SizedBox(
//             height: 119,
//             width: 342,
//             child: GridView.builder(
//               shrinkWrap: true, // Ensures the GridView does not scroll
//               physics: const NeverScrollableScrollPhysics(),

//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 mainAxisSpacing: 11,
//                 crossAxisSpacing: 9,
//                 childAspectRatio: 166.5 / 54,
//               ),
//               itemCount: buttonData.length,
//               itemBuilder: (context, index) {
//                 return GridActionButton(
//                   iconUrl: buttonData[index]['image'],
//                   color: buttonData[index]['color'],
//                   opacity: buttonData[index]['opacity'],
//                 );
//               },
//             ),
//           )