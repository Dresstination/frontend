import 'package:carousel_slider/carousel_slider.dart';
import 'package:dresti_frontend/src/fetcher/fetcher.dart';
import 'package:dresti_frontend/src/widgets/expandviewScreen/product_card.dart';
import 'package:dresti_frontend/src/widgets/expandviewScreen/quick_link_button.dart';
import 'package:dresti_frontend/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ExpandView extends StatefulWidget {
  final String token;

  final String outfitId;
  ExpandView({super.key, required this.token, required this.outfitId});

  @override
  State<ExpandView> createState() => _ExpandViewState();
}

class _ExpandViewState extends State<ExpandView> {
  final List<String> buttonData = [
    'assets/images/grid-icon1.svg',
    'assets/images/grid-icon2.svg',
    'assets/images/grid-icon3.svg',
    'assets/images/grid-icon4.svg',
  ];

  // final List<Map<String, dynamic>> products = [
  //   {
  //     'imgUrl': 'assets/images/f-4.png',
  //     'description': 'FableStreet LivSoft Turtle Neck Sweater..',
  //     'link': 'https://example.com/product1',
  //     'price': 1250.0,
  //   },
  //   {
  //     'imgUrl': 'assets/images/f-3.png',
  //     'description': 'FableStreet LivSoft Turtle Neck Sweater..',
  //     'link': 'https://example.com/product2',
  //     'price': 1500.0,
  //   },
  //   {
  //     'imgUrl': 'assets/images/f-1.png',
  //     'description': 'FableStreet LivSoft Turtle Neck Sweate...',
  //     'link': 'https://example.com/product3',
  //     'price': 1800.0,
  //   },
  // ];

  // final List<String> imgList = [
  //   'https://plus.unsplash.com/premium_photo-1669138520397-9147a0a55fff?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8Z2lybHMlMjBmYXNoaW9ufGVufDB8fDB8fHww',
  //   'https://images.unsplash.com/photo-1591155048800-93b29d215ed8?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8Z2lybHMlMjBmYXNoaW9ufGVufDB8fDB8fHww',
  //   'https://plus.unsplash.com/premium_photo-1669138512601-e3f00b684edc?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTd8fGdpcmxzJTIwZmFzaGlvbnxlbnwwfHwwfHx8MA%3D%3D',
  //   'https://plus.unsplash.com/premium_photo-1670282393309-70fd7f8eb1ef?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fGdpcmxzJTIwZmFzaGlvbnxlbnwwfHwwfHx8MA%3D%3D',
  // ];

  int curpage = 0; // To track the current carousel image index

  // UcCA4DCfyMMmvTTn3aY5

  Future<Map<String, dynamic>>? futureData;

  @override
  void initState() {
    super.initState();
    Fetcher fetcher = Fetcher();

    futureData =
        fetcher.getOutfitProductsDetails(widget.token, widget.outfitId);

    print("### $futureData");
  }

  String _truncateTitle(String title) {
    const int maxLength = 24;

    // Capitalize the first letter of each word
    String capitalizeWords(String str) {
      return str.split(' ').map((word) {
        if (word.isEmpty) return word;
        return '${word[0].toUpperCase()}${word.substring(1)}';
      }).join(' ');
    }

    // Capitalize the title
    String capitalizedTitle = capitalizeWords(title);

    // Truncate the title if necessary
    if (capitalizedTitle.length > maxLength) {
      return '${capitalizedTitle.substring(0, maxLength)}...';
    }
    return capitalizedTitle;
  }

  @override
  Widget build(BuildContext context) {
    // final List<Widget> imageSliders = imgList
    //     .map((item) => ClipRRect(
    //           borderRadius: BorderRadius.circular(20),
    //           child: Container(
    //               height: 345,
    //               width: 361,
    //               child: Image.network(item, fit: BoxFit.fill)),
    //         ))
    //     .toList();

    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 26),
        child: FutureBuilder<Map<String, dynamic>>(
            future: futureData,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container(
                  height: MediaQuery.of(context).size.height,
                  child: const Center(
                      child: CircularProgressIndicator(
                    color: Colors.white,
                  )),
                );
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return SizedBox(
                    height: 500,
                    child: Center(child: Text('No data available')));
              } else {
                final data = snapshot.data!;
                String formattedDate =
                    Fetcher().formatTimestamp(data['timestamp']);
                // print(data);

                final List<dynamic> outfitElements = data['outfitElements'];
                print(outfitElements);
                final List<Widget> imageSliders = outfitElements
                    .map<Widget>((item) => ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            height: 345,
                            width: 361,
                            child: Image.network(item['imageURL'],
                                fit: BoxFit.fill),
                          ),
                        ))
                    .toList();
                return Column(
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
                            child: SvgPicture.asset(
                                "assets/images/chevron-left.svg",
                                height: 32,
                                width: 32),
                          ),
                          const SizedBox(
                            width: 24,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _truncateTitle(data['title']),
                                style: Styles.customTextStyle(
                                    'fontSize_18', 'fontWeight_600',
                                    color: const Color(0xffF0F0F7)),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                formattedDate,
                                style: Styles.customTextStyle(
                                    'fontSize_14', 'fontWeight_400',
                                    color: const Color(0xffFFFFFF)
                                        .withOpacity(0.7)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Stack(
                      children: [
                        Container(
                          height: 345,
                          width: 361,
                          margin: const EdgeInsets.symmetric(vertical: 30),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: CarouselSlider(
                              options: CarouselOptions(
                                height: 345,
                                aspectRatio: 1,
                                enlargeCenterPage: true,
                                viewportFraction: 1.0,
                                enableInfiniteScroll: false,
                                initialPage: 0,
                                autoPlay: false,
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    curpage = index;
                                  });
                                },
                              ),
                              items: imageSliders,
                            ),
                          ),
                        ),
                        Positioned(
                            bottom: 50,
                            left: 0,
                            right: 0,
                            child: Align(
                              alignment: Alignment.center,
                              child: Container(
                                width: 43,
                                height: 25,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(19.91),
                                ),
                                child: Center(
                                  child: Text(
                                    "${curpage + 1}/${data.length}",
                                    textAlign: TextAlign.center,
                                    style: Styles.customTextStyle(
                                      'fontSize_14',
                                      'fontWeight_700',
                                    ),
                                  ),
                                ),
                              ),
                            ))
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Text(
                        outfitElements[curpage]['searchQuery'],
                        style: Styles.customTextStyle(
                            'fontSize_24', 'fontWeight_600',
                            color: const Color(0xffFFFFFF)),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 12),
                      child: Text(
                        outfitElements[curpage]['description'],
                        style: Styles.customTextStyle(
                            'fontSize_14', 'fontWeight_400',
                            color: const Color(0xffFFFFFF).withOpacity(0.7)),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 26),
                      child: Text(
                        "Quick Links",
                        style: Styles.customTextStyle(
                            'fontSize_18', 'fontWeight_600',
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
                            imgURL: outfitElements[curpage]['imageURL'],
                            dress: outfitElements[curpage]['searchQuery'],
                          );
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 37),
                      child: Text(
                        "Products",
                        style: Styles.customTextStyle(
                            'fontSize_18', 'fontWeight_600',
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
                          final product =
                              outfitElements[curpage]['products'][index];

                          return ProductCard(
                            imgUrl: product['imageURL'],
                            title: product['title'],
                            link: product['link'],
                            price: product['price'] == "N/A"
                                ? " "
                                : product['price'],
                          );
                        },
                      ),
                    ),
                  ],
                );
              }
            }),
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