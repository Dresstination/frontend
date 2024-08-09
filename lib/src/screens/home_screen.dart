import 'package:dresti_frontend/src/widgets/initScreen/branding_text_widget.dart';
import 'package:dresti_frontend/src/widgets/initScreen/primary_action_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class DrestinationHome extends StatefulWidget {
  const DrestinationHome({super.key});

  @override
  State<DrestinationHome> createState() => _DrestinationHomeState();
}

class _DrestinationHomeState extends State<DrestinationHome> {
  Future<dynamic> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      return await FirebaseAuth.instance.signInWithCredential(credential);
    } on Exception catch (e) {
      // TODO
      print('exception->$e');
    }
  }

  Future<void> signOutFromGoogle() async {
    try {
      await FirebaseAuth.instance.signOut();
      print("Signout Success");
    } on Exception catch (error) {
      print(error);
    }
  }

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
                child: WidgetAnimator(
                  atRestEffect: WidgetRestingEffects.dangle(
                      numberOfPlays: 1, duration: Duration(seconds: 3)),
                  child: SvgPicture.asset(
                    "assets/images/Group 35.svg",
                    width: 230,
                    height: 347,
                  ),
                )),
          ),
          Positioned(
              left: 0,
              right: 0,
              top: MediaQuery.of(context).size.height / 2 + 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const BrandingText(),
                  Container(
                    height: 56,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 39, vertical: 22),
                    child: Text(
                        "Lorem ipsum dolor sit amet consectetur. Vulputate nibh eu cras adipiscing ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.white.withOpacity(0.5))),
                  ),
                  PrimaryActionButton(onSignInWithGoogle: signInWithGoogle),
                ],
              )),
        ],
      ),
    );
  }
}
