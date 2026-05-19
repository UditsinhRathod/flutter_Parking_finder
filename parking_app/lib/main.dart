import 'package:flutter/material.dart';
import 'package:parking_app/Widgets/AddParkingArea.dart';
import 'package:parking_app/Widgets/splash_screen.dart';

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
            child: Text(
              'Parking App',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: Center(child: AddParkingArea()),
      ),
    ),
  );
}
