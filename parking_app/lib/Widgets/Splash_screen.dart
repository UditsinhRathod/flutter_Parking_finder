import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,

      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white,
            const Color.fromARGB(154, 63, 107, 112),
            Color.fromARGB(144, 19, 47, 80),
          ],
        ),
      ),

      child: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("logo_2.png", width: 200),
                Text(
                  "ParkEase",
                  style: TextStyle(
                    fontSize: 32,
                    color: Color.fromARGB(255, 20, 20, 20),
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 50),
                CircularProgressIndicator(color: Color(0xFF1565C0)),
                SizedBox(height: 20),

                Text(
                  "Loading...",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 20, 20, 20),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 20,
            right: 20,
            child: Text(
              "Version 1.0",
              style: TextStyle(
                fontSize: 17,
                color: Color.fromARGB(255, 20, 20, 20),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            child: Text(
              "Copyright (2025-2026)",
              style: TextStyle(
                fontSize: 14,
                color: Color.fromARGB(255, 20, 20, 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
