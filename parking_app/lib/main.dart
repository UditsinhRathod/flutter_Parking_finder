import 'package:flutter/material.dart';
import 'package:parking_app/Widgets/HomeScreen.dart';
import 'package:parking_app/Widgets/Splash_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
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
}
