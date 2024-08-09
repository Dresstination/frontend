import 'dart:io';

import 'package:dresti_frontend/src/screens/dashboard_screen.dart';
import 'package:dresti_frontend/src/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
            apiKey: "AIzaSyBjJh2YXp9NC8mJiIW-jw24ufdXC1u2a3Y",
            appId: "1:938482069909:android:b5986ca70d7f13f652069c",
            messagingSenderId: "938482069909",
            projectId: "internapp-dbde8",
          ),
        )
      : await Firebase.initializeApp();
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
                userName: snapshot.data!.displayName.toString());
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
