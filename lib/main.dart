import 'package:dresti_frontend/src/screens/drestination_home_screen.dart';
import 'package:flutter/material.dart';

void main() {
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
      home: const DrestinationHome(),
    );
  }
}
