import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,

      // Gradient Background
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF1565C0), // Dark Blue
            Color(0xFF42A5F5), // Light Blue
            Colors.white, // White
          ],
        ),
      ),

      child: Stack(
        children: [
          // Center content - Logo, App name, Loader, Loading text
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

                // const CircularProgressIndicator(
                //   valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF1565C0)),
                // ),
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

          // Version 1.0 - Top Right corner
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

          // Copyright - Bottom Left corner
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
