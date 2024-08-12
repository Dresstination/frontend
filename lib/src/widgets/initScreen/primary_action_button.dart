import 'package:dresti_frontend/src/screens/dashboard_screen.dart';
import 'package:dresti_frontend/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PrimaryActionButton extends StatelessWidget {
  final Future<dynamic> Function()? onSignInWithGoogle;
  const PrimaryActionButton({super.key, required this.onSignInWithGoogle});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> isLoggingIn = ValueNotifier(false);
    ValueNotifier userCredential = ValueNotifier('');

    return ValueListenableBuilder<bool>(
        valueListenable: isLoggingIn,
        builder: (context, loggingIn, child) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
            child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(338, 54),
                  backgroundColor: const Color(0xffffffff),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(49.0),
                  ),
                ),
                onPressed: () async {
                  isLoggingIn.value = true;

                  try {
                    userCredential.value = await onSignInWithGoogle!();

                    if (userCredential.value != null) {
                      // final SharedPreferences prefs =
                      //     await SharedPreferences.getInstance();
                      // await prefs.setString(
                      //     'authToken',
                      //     userCredential.value.credential.accessToken
                      //         .toString());
                      print(userCredential.value);
                      print(userCredential.value.credential.accessToken);
                      print(userCredential.value.user!.email);
                      print("### ${userCredential.value.user!.uid}");

                      // ignore: use_build_context_synchronously
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DashboardScreen(
                                    userName:
                                        userCredential.value.user!.displayName,
                                    userId: userCredential.value.user!.uid,
                                  )));
                    }
                  } finally {
                    isLoggingIn.value = false;
                  }
                },
                icon: loggingIn
                    ? const CircularProgressIndicator(
                        color: Colors.black,
                        strokeWidth: 2,
                      )
                    : SvgPicture.asset("assets/images/Google.svg"),
                label: Text(
                  "GET STARTED",
                  style: Styles.customTextStyle(
                    'fontSize_16',
                    'fontWeight_600',
                  ),
                )),
          );
        });
  }
}
