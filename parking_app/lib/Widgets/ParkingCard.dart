import 'package:flutter/material.dart';
import 'package:parking_app/Class.dart';

class ParkingCard extends StatefulWidget {
  final ParkingArea parkingArea;

  const ParkingCard({super.key, required this.parkingArea});

  @override
  State<ParkingCard> createState() => _ParkingCardState();
}

class _ParkingCardState extends State<ParkingCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          ListTile(
            title: Text(widget.parkingArea.name),
            subtitle: Text(
              '${widget.parkingArea.location}, ${widget.parkingArea.city}',
            ),
          ),
        ],
      ),
    );
  }
}
