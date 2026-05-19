import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Screen 2")),

      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, "/screen3");
          },

          child: Text("Go To Screen3"),
        ),
      ),
    );
  }
}
