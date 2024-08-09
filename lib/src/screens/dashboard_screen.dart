import 'package:dresti_frontend/src/screens/home_screen.dart';
import 'package:dresti_frontend/src/widgets/dashboardScreen/gradiant_container.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
      body: SafeArea(
        child: Column(
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
                        child: Image.asset("assets/images/Group 36.jpg"),
                      ),
                      SizedBox(
                        width: 151,
                        height: 78,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Welcome",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 22,
                                  color: Colors.black),
                            ),
                            Text(
                              widget.userName.split(" ")[0],
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 30,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Center(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(250, 54),
                    backgroundColor: const Color(0xffffffff),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                  ),
                  onPressed: () async {
                    bool isSignout = await signOutFromGoogle();

                    if (isSignout) {
                      // ignore: use_build_context_synchronously
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DrestinationHome()));
                    }
                  },
                  child: const Text("Signout")),
            ),
          ],
        ),
      ),
    );
  }
}
