import 'package:dresti_frontend/src/fetcher/fetcher.dart';
import 'package:dresti_frontend/src/screens/expand_view_screen.dart';

import 'package:dresti_frontend/src/screens/search_screen.dart';
import 'package:dresti_frontend/src/widgets/dashboardScreen/gradiant_container.dart';
import 'package:dresti_frontend/src/widgets/dashboardScreen/gridview_image.dart';
import 'package:dresti_frontend/src/widgets/dashboardScreen/profile_image_generated.dart';
import 'package:dresti_frontend/styles/styles.dart';

import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

// ignore: must_be_immutable
class DashboardScreen extends StatefulWidget {
  String userName;
  String userId;

  DashboardScreen({
    super.key,
    required this.userName,
    required this.userId,
  });

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  // Future<bool> signOutFromGoogle() async {

  Future<List<Map<String, dynamic>>>? futureData;

  @override
  void initState() {
    super.initState();
    Fetcher fetcher = Fetcher();

    futureData = fetcher.getOutfitsData(widget.userId);

    // print("### $futureData");
  }

  // Future<bool> signOutFromGoogle() async {
  //   try {
  //     await FirebaseAuth.instance.signOut();
  //     print("Signout Success");
  //     return true;
  //   } on Exception catch (error) {
  //     print(error);
  //     return false;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        SafeArea(
          child: SizedBox(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      const GradientContainer(),
                      Positioned(
                        bottom: 35,
                        left: 19,
                        child: Row(
                          children: [
                            ProfileImageGeneration(userId: widget.userId),
                            SizedBox(
                              width: 151,
                              height: 78,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Welcome",
                                      style: Styles.customTextStyle(
                                          'fontSize_22', 'fontWeight_400')),
                                  Text(widget.userName.split(" ")[0],
                                      style: Styles.customTextStyle(
                                          'fontSize_32', 'fontWeight_700')),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Center(
                      //   child: ElevatedButton(
                      //       style: ElevatedButton.styleFrom(
                      //         minimumSize: const Size(250, 54),
                      //         backgroundColor: const Color(0xffffffff),
                      //         shape: RoundedRectangleBorder(
                      //           borderRadius: BorderRadius.circular(2.0),
                      //         ),
                      //       ),
                      //       onPressed: () async {
                      //         bool isSignout = await signOutFromGoogle();

                      //         if (isSignout) {
                      //           // ignore: use_build_context_synchronously
                      //           Navigator.pushReplacement(
                      //               context,
                      //               MaterialPageRoute(
                      //                   builder: (context) =>
                      //                       const DrestinationHome()));
                      //         }
                      //       },
                      //       child: const Text("Signout")),
                      // ),
                    ],
                  ),
                  Container(
                    width: 58,
                    height: 21,
                    margin: EdgeInsets.only(top: 37, left: 24),
                    child: Text(
                      "History",
                      style: Styles.customTextStyle(
                          'fontSize_18', 'fontWeight_600',
                          color: const Color(0xffF0F0F7)),
                    ),
                  ),

                  // History Components
                  FutureBuilder<List<Map<String, dynamic>>>(
                      future: futureData,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const SizedBox(
                            height: 500,
                            child: Center(
                                child: CircularProgressIndicator(
                              color: Colors.white,
                            )),
                          );
                        } else if (snapshot.hasError) {
                          return Center(
                              child: Text('Error: ${snapshot.error}'));
                        } else if (!snapshot.hasData ||
                            snapshot.data!.isEmpty) {
                          return SizedBox(
                              height: 500,
                              child: Center(
                                  child: Lottie.asset(
                                      "assets/lottie/no-item.json",
                                      height: 20,
                                      width: 20,
                                      fit: BoxFit.fill)));
                        } else {
                          final data = snapshot.data!;
                          print(data);
                          return ListView.builder(
                              shrinkWrap:
                                  true, // Ensures the GridView does not scroll
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: data.length,
                              itemBuilder: (context, index) {
                                final item = data[index];
                                String formattedDate = Fetcher()
                                    .formatTimestamp(item['timestamp']);
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(
                                          left: 24, top: 47),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            formattedDate,
                                            style: Styles.customTextStyle(
                                                'fontSize_14', 'fontWeight_400',
                                                color: const Color(0xffFFFFFF)
                                                    .withOpacity(0.7)),
                                          ),
                                          const SizedBox(
                                            height: 4,
                                          ),
                                          Text(
                                            item['title'],
                                            style: Styles.customTextStyle(
                                                'fontSize_24', 'fontWeight_600',
                                                color: const Color(0xffF0F0F7)
                                                    .withOpacity(0.9)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                        // color: Colors.red,
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 49, horizontal: 78),
                                        // color: Colors.blue,
                                        child: CustomImageGrid(
                                          outfitElements:
                                              item['outfitElements'],
                                          token: widget.userId,
                                          outfitId: item['id'],
                                        )),
                                    Center(
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => ExpandView(
                                                token: widget.userId,
                                                outfitId: item['id'],
                                              ),
                                            ),
                                          );
                                        },
                                        child: SizedBox(
                                          height: 24,
                                          width: 109,
                                          child: Row(
                                            children: [
                                              Text(
                                                "All Options",
                                                style: Styles.customTextStyle(
                                                    'fontSize_16',
                                                    'fontWeight_500',
                                                    color:
                                                        const Color(0xffF0F0F7)
                                                            .withOpacity(0.9)),
                                              ),
                                              const SizedBox(
                                                width: 2.5,
                                              ),
                                              Image.asset(
                                                "assets/images/arrow.png",
                                                height: 24,
                                                width: 24,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          top: 62, bottom: 45),
                                      child: SvgPicture.asset(
                                          "assets/images/line.svg"),
                                    )
                                  ],
                                );
                              });
                        }
                      }),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 27,
          left: 0,
          right: 0,
          child: Align(
            alignment: Alignment.center,
            child: ElevatedButton.icon(
              icon: SvgPicture.asset("assets/images/sparkles.svg"),
              label: Text(
                "DRESSIFY",
                style: Styles.customTextStyle(
                  'fontSize_14',
                  'fontWeight_600',
                ),
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(148, 54),
                backgroundColor: Color(0xffF0F0F7),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(42),
                    side: BorderSide(width: 1, color: Color(0xff000000))),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchScreen(token: widget.userId),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    ));
  }
}
