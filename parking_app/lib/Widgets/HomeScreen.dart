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

  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final filteredParkingAreas = getParkingAreas.where((area) {
      return area.name.toLowerCase().contains(searchQuery.toLowerCase()) || 
             area.location.toLowerCase().contains(searchQuery.toLowerCase()) ||
             area.city.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();

    return ListView.builder(
      itemCount: filteredParkingAreas.length + 1,
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
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Icon(Icons.search_outlined),
                    ),
                    Expanded(
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            searchQuery = value;
                          });
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search',
                          contentPadding: EdgeInsets.symmetric(horizontal: 8),
                          isDense: true,
                        ),
                      ),
                    ),
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
                      arguments: {
                        'toAdd': getParkingAreas,
                        'toEdit': null,
                      },
                    ).then((_) {
                      setState(() {});
                    });
                  },
                  icon: Icon(Icons.add),
                  label: Text('Add Parking Area'),
                  autofocus: true,
                ),
              ),
            ],
          );
        }

        final parkingArea = filteredParkingAreas[index - 1];
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
