import 'package:flutter/material.dart';
import 'package:parking_app/Class.dart';
import 'package:parking_app/Widgets/AddParkingArea.dart';
import 'package:parking_app/Widgets/HomeScreen.dart';
// import 'package:parking_app/Widgets/Screen_2.dart';
import 'package:parking_app/Widgets/Splash_screen.dart';
// import 'Screen_2.dart';
import 'Screen_3.dart';

class FragmentPlaceholder extends StatefulWidget {
  @override
  State<FragmentPlaceholder> createState() => _FragmentPlaceholderState();
}

class _FragmentPlaceholderState extends State<FragmentPlaceholder> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  List<ParkingArea> getParkingAreas = [
    ParkingArea(
      name: 'A-Z Parking',
      location: 'Bapunagar',
      city: 'Ahemdabad',
      totalSlots: 20,
    ),
  ];
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      _navigatorKey.currentState?.pushReplacementNamed(
        "/HomeScreen",
        arguments: {'parkingAreas': getParkingAreas},
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Parking App", style: TextStyle(color: Colors.white)),
          backgroundColor: const Color.fromARGB(255, 68, 140, 199),
        ),

        body: Navigator(
          key: _navigatorKey,
          onGenerateRoute: (settings) {
            switch (settings.name) {
              case "/":
                return MaterialPageRoute(builder: (_) => SplashScreen());
              case "/HomeScreen":
                return MaterialPageRoute(
                  builder: (_) => Homescreen(parkingAreas: getParkingAreas),
                );

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
        ),
      ),
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
