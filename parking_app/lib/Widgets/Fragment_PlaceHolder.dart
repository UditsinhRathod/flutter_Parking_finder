import 'package:flutter/material.dart';
import 'package:parking_app/Class.dart';
import 'package:parking_app/Widgets/AddParkingArea.dart';
import 'package:parking_app/Widgets/HomeScreen.dart';
import 'package:parking_app/Widgets/Splash_screen.dart';
// import 'Screen_2.dart';
import 'Screen_3.dart';

class FragmentPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case "/":
            return MaterialPageRoute(builder: (_) => Homescreen());

          case "/AddParkingArea":
            final args = settings.arguments as Map<String, dynamic>;
            return MaterialPageRoute(
              builder: (_) => AddParkingArea(
                toAdd: args['toAdd'] as List<ParkingArea>,
                toEdit: args['toEdit'] as ParkingArea?,
              ),
            );

          case "/screen3":
            return MaterialPageRoute(builder: (_) => Screen3());

          default:
            return MaterialPageRoute(builder: (_) => SplashScreen());
        }
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),

      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, "/screen2");
          },

          child: Text("Go To Screen2"),
        ),
      ),
    );
  }
}
