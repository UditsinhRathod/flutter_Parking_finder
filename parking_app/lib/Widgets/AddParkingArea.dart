// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:parking_app/Class.dart';

class AddParkingArea extends StatefulWidget {
  List<ParkingArea> toAdd;
  ParkingArea? toEdit;
  AddParkingArea({super.key, required this.toAdd, this.toEdit});

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

  @override
  void initState() {
    super.initState();
    if (widget.toEdit != null) {
      nameController.text = widget.toEdit!.name;
      locationController.text = widget.toEdit!.location;
      cityController.text = widget.toEdit!.city;
      totalSlotsController.text = widget.toEdit!.totalSlots.toString();
    }
  }

  void onAdd() {
    if (widget.toEdit != null) {
      widget.toEdit!.name = nameController.text;
      widget.toEdit!.location = locationController.text;
      widget.toEdit!.city = cityController.text;
      
      int newSlots = int.parse(totalSlotsController.text);
      if (newSlots != widget.toEdit!.totalSlots) {
        widget.toEdit!.totalSlots = newSlots;
        widget.toEdit!.availableSlots = newSlots;
        widget.toEdit!.parkingSlots = [];
        for (int i = 1; i <= newSlots; i++) {
          widget.toEdit!.parkingSlots.add(ParkingSlot(slotNumber: "S$i", isAvailable: true));
        }
      }
    } else {
      widget.toAdd.add(
        ParkingArea(
          name: nameController.text,
          location: locationController.text,
          city: cityController.text,
          totalSlots: int.parse(totalSlotsController.text),
        ),
      );
    }
    Navigator.pop(context);
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
                  onAdd();
                },
                child: Text(widget.toEdit != null ? "Save Changes" : "Add Parking Area"),
              ),
            ),
          ],
        ),
    );
  }
}
