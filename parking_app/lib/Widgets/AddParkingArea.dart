import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:parking_app/Class.dart';

class AddParkingArea extends StatefulWidget {
  List<ParkingArea> toAdd;
  AddParkingArea({super.key , required this.toAdd});

  @override
  State<AddParkingArea> createState() => _AddParkingAreaState();
}

class _AddParkingAreaState extends State<AddParkingArea> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController locationController = TextEditingController();

  final TextEditingController cityController = TextEditingController();

  final TextEditingController totalSlotsController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    locationController.dispose();
    cityController.dispose();
    totalSlotsController.dispose();

    super.dispose();
  }

  void onAdd(){
    setState(() {
      widget.toAdd = [...widget.toAdd , ParkingArea(name: nameController.text, location: locationController.text, city: cityController.text, totalSlots: int.parse(totalSlotsController.text))]
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),

      child: Column(
        children: [
          TextField(
            controller: nameController,

            decoration: InputDecoration(
              labelText: "Parking Name",
              border: OutlineInputBorder(),
            ),
          ),

          SizedBox(height: 15),

          TextField(
            controller: locationController,

            decoration: InputDecoration(
              labelText: "Location",
              border: OutlineInputBorder(),
            ),
          ),

          SizedBox(height: 15),

          TextField(
            controller: cityController,

            decoration: InputDecoration(
              labelText: "City",
              border: OutlineInputBorder(),
            ),
          ),

          SizedBox(height: 15),

          TextField(
            controller: totalSlotsController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Total Slots",
              border: OutlineInputBorder(),
            ),
          ),

          SizedBox(height: 25),

          SizedBox(
            width: double.infinity,

            child: ElevatedButton(
              onPressed: () {
                null;
              },
              child: Text("Add Parking Area"),
            ),
          ),
        ],
      ),
    );
  }
}
