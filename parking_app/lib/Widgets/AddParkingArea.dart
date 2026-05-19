import 'package:flutter/material.dart';

class AddParkingArea extends StatefulWidget {
  const AddParkingArea({super.key});

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
