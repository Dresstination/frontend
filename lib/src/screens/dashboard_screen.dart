import 'package:dresti_frontend/src/screens/search_screen.dart';
import 'package:dresti_frontend/src/widgets/dashboardScreen/gradiant_container.dart';
import 'package:dresti_frontend/src/widgets/dashboardScreen/gridview_image.dart';
import 'package:dresti_frontend/styles/styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class DashboardScreen extends StatefulWidget {
  String userName;
  DashboardScreen({super.key, required this.userName});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  Future<bool> signOutFromGoogle() async {
    try {
      await FirebaseAuth.instance.signOut();
      print("Signout Success");
      return true;
    } on Exception catch (error) {
      print(error);
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            child: SizedBox(
              height: MediaQuery.of(context).size.height - 110,
              child: SingleChildScrollView(
                child: SafeArea(
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
                                Container(
                                  width: 70.55,
                                  height: 70.85,
                                  margin: const EdgeInsets.only(right: 16.15),
                                  child:
                                      Image.asset("assets/images/Group_36.png"),
                                ),
                                SizedBox(
                                  width: 151,
                                  height: 78,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                      ListView.builder(
                          shrinkWrap:
                              true, // Ensures the GridView does not scroll
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin:
                                      const EdgeInsets.only(left: 24, top: 47),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Aug 10, 2024",
                                        style: Styles.customTextStyle(
                                            'fontSize_14', 'fontWeight_400',
                                            color: const Color(0xffFFFFFF)
                                                .withOpacity(0.7)),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        "A Cousin’s Wedding ",
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
                                      index: index,
                                    )),
                                Center(
                                  child: InkWell(
                                    onTap: () {},
                                    child: SizedBox(
                                      height: 24,
                                      width: 109,
                                      child: Row(
                                        children: [
                                          Text(
                                            "All Options",
                                            style: Styles.customTextStyle(
                                                'fontSize_16', 'fontWeight_500',
                                                color: const Color(0xffF0F0F7)
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
                              ],
                            );
                          }),
                      Container(
                        margin: const EdgeInsets.only(top: 22),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Stack(
            alignment: Alignment.center, // Center the button in the line.svg
            children: [
              SvgPicture.asset("assets/images/line.svg"),
              ElevatedButton.icon(
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
                      builder: (context) => SearchScreen(),
                    ),
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
