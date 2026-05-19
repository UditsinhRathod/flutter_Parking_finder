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
          totalSlots: 10,
        ),
      ];
    });
  }

  //TextEditingController controller = TextEditingController();

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
                margin: EdgeInsets.all(20),
                width: 120,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),

                child: Row(
                  children: [
                    Icon(Icons.search_outlined),
                    //TextField(controller: controller),
                  ],
                ),
              ),
              Spacer(),
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
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      "/AddParkingArea",
                      arguments: getParkingAreas,
                    );
                  },
                  icon: Icon(Icons.add),
                  label: Text('Add Parking Area'),
                  autofocus: true,
                ),
              ),
            ],
          );
        }

        final parkingArea = getParkingAreas[index - 1];
        return ParkingCard(
          parkingArea: parkingArea,
          getParkingAreas: getParkingAreas,
          onDeleteCallback: () {
            setState(() {
              getParkingAreas.remove(parkingArea);
            });
          },
        );
      },
    );
  }
}
