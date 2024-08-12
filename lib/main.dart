import 'dart:io';

import 'package:dresti_frontend/src/screens/dashboard_screen.dart';
import 'package:dresti_frontend/src/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
            apiKey: "AIzaSyBSfrDk2F23vDZxq_aeHERBWiGoDshv7Gs",
            appId: "1:522222707493:android:0d679c6a1b23d43da230cc",
            messagingSenderId: "522222707493",
            projectId: "dresstination-a2b2f",
          ),
        )
      : await Firebase.initializeApp();
  await dotenv.load(fileName: ".env");
  runApp(const DrestinationApp());
}

class DrestinationApp extends StatelessWidget {
  const DrestinationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Destrination App',
      theme: ThemeData(
        fontFamily: 'Gilroy',
        colorScheme: const ColorScheme.dark(primary: Colors.black),
        useMaterial3: true,
      ),
      home: FutureBuilder<User?>(
        future: _checkUserSignInStatus(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData && snapshot.data != null) {
            return DashboardScreen(
              userName: snapshot.data!.displayName.toString(),
              userId: snapshot.data!.uid.toString(),
            );
          } else {
            return const DrestinationHome();
          }
        },
      ),
    );
  }

  Future<User?> _checkUserSignInStatus() async {
    return FirebaseAuth.instance.currentUser;
  }
}
