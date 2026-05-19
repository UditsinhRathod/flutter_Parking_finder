import 'package:flutter/material.dart';
import 'Screen_2.dart';
import 'Screen_3.dart';

class FragmentPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case "/":
            return MaterialPageRoute(builder: (_) => HomePage());

          case "/screen2":
            return MaterialPageRoute(builder: (_) => Screen2());

          case "/screen3":
            return MaterialPageRoute(builder: (_) => Screen3());

          default:
            return MaterialPageRoute(builder: (_) => HomePage());
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
