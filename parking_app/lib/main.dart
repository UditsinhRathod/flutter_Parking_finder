import 'package:flutter/material.dart';
import 'package:parking_app/Widgets/splash_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SplashScreen(),
        backgroundColor: const Color.fromARGB(133, 11, 13, 15),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: const Color.fromARGB(255, 90, 88, 96),
    );
  }
}
