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
            apiKey: "AIzaSyBOayvQYJIk2Pi-1ABHXcsIKVWqWecTML0",
            appId: "1:196615271879:android:559af6f5b19889937015e2",
            messagingSenderId: "196615271879",
            projectId: "dresstination-v2",
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
