import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:parking_app/Widgets/HomeScreen.dart';
import 'package:parking_app/Widgets/Splash_screen.dart';
=======
import 'package:parking_app/Widgets/splash_screen.dart';
>>>>>>> d64bd9c3cc86f457c62525e31dd0f86e88914c32

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
<<<<<<< HEAD
      title: 'Parking App',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF1565C0),
          foregroundColor: Colors.white,
          title: Center(
            child: const Text(
              'Parking App',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: Center(child: SplashScreen()),
      ),
    ),
  );
=======
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
>>>>>>> d64bd9c3cc86f457c62525e31dd0f86e88914c32
}
