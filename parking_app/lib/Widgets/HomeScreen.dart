import 'package:flutter/material.dart';
import 'package:parking_app/Class.dart';
import 'package:parking_app/Widgets/ParkingCard.dart';
import 'package:parking_app/Widgets/Save.dart';

class Homescreen extends StatefulWidget {
  List<ParkingArea> parkingAreas;
  Homescreen({super.key, required this.parkingAreas});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final filteredParkingAreas = widget.parkingAreas.where((area) {
      return area.name.toLowerCase().contains(searchQuery.toLowerCase()) ||
          area.location.toLowerCase().contains(searchQuery.toLowerCase()) ||
          area.city.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        
        title: Center(
          child: Text(
            "ParkEase",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 68, 140, 199),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Hello, Administrator",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        "/AddParkingArea",
                        arguments: {
                          'toAdd': widget.parkingAreas,
                          'toEdit': null,
                        },
                      ).then((_) {
                        setState(() {});
                      });
                    },
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.add, color: Colors.black),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value;
                    });
                  },
                  decoration: const InputDecoration(
                    hintText: 'Search parking areas',
                    hintStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 14),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: filteredParkingAreas.length,
                  itemBuilder: (context, index) {
                    final parkingArea = filteredParkingAreas[index];
                    return ParkingCard(
                      parkingArea: parkingArea,
                      getParkingAreas: widget.parkingAreas,
                      onDeleteCallback: () {
                        setState(() {
                          widget.parkingAreas.remove(parkingArea);
                        });
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
