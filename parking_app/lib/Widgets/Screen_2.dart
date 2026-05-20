import 'package:flutter/material.dart';
import 'package:parking_app/Class.dart';

class Screen2 extends StatelessWidget {
  final List<ParkingArea> parkingAreas;

  Screen2({required this.parkingAreas});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Screen 2")),

      body: parkingAreas.isEmpty
          ? Center(child: Text("No Parking Areas Available"))
          : ListView.builder(
              itemCount: parkingAreas.length,
              itemBuilder: (context, index) {
                final area = parkingAreas[index];
                return Card(
                  margin: EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(area.name),
                    subtitle: Text('${area.location}, ${area.city}'),
                    trailing: Text('Total Slots: ${area.totalSlots}\nAvailable: ${area.availableSlots ?? 0}'),
                    onTap: () {
                      Navigator.pushNamed(context, "/screen3");
                    },
                  ),
                );
              },
            ),
    );
  }
}
