import 'package:flutter/material.dart';
import 'package:parking_app/Class.dart';
import 'package:parking_app/Widgets/ParkingCard.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<ParkingArea> getParkingAreas = [
    ParkingArea(
      name: 'A-Z Parking',
      location: 'Bapunagar',
      city: 'Ahemdabad',
      totalSlots: 20,
      availableSlots: 5,
      parkingSlots: [
        ParkingSlot(slotNumber: 'A1', isAvailable: true),
        ParkingSlot(slotNumber: 'A2', isAvailable: false),
        // Add more slots as needed
      ],
    ),
  ];

  void addParkingArea() {
    // Logic to add a new parking area
    setState(() {
      getParkingAreas = [
        ...getParkingAreas,
        ParkingArea(
          name: 'New Parking Area',
          location: 'New Location',
          city: 'New City',
          totalSlots: 30,
          availableSlots: 30,
          parkingSlots: [
            ParkingSlot(slotNumber: 'B1', isAvailable: true),
            ParkingSlot(slotNumber: 'B2', isAvailable: false),
            // Add more slots as needed
          ],
        ),
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: getParkingAreas.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.4),
                      blurRadius: 10.0,
                      offset: const Offset(4, 5),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(12.0),
                ),
                margin: const EdgeInsets.all(10.0),
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Color(0xFF1565C0),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onPressed: addParkingArea,
                  icon: Icon(Icons.add),
                  label: Text('Add Parking Area'),
                  autofocus: true,
                ),
              ),
            ],
          );
        }

        final parkingArea = getParkingAreas[index - 1];
        return ParkingCard(parkingArea: parkingArea);
      },
    );
  }
}
