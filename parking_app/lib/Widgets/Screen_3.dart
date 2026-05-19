import 'package:flutter/material.dart';

class Screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Screen 3")),

      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },

          child: Text("Back"),
        ),
      ),
    );
  }
}
