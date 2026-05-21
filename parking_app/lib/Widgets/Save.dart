import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:parking_app/Class.dart';

void saveData(List<ParkingArea> parkingAreas) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  String parkingAreasJson = jsonEncode(
    parkingAreas.map((area) => area.toJson()).toList(),
  );
  await prefs.setString('parkingAreas', parkingAreasJson);
}

Future<void> loadData(List<ParkingArea> parkingAreas) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? parkingAreaJson = prefs.getString('parkingAreas');
  if (parkingAreaJson != null) {
    List<dynamic> parkingAreaList = jsonDecode(parkingAreaJson);
    parkingAreas.clear();
    parkingAreas.addAll(
        parkingAreaList.map(
          (areaJson) => ParkingArea(
            name: areaJson['name'],
            location: areaJson['location'],
            city: areaJson['city'],
            totalSlots: areaJson['totalSlots'],
          ),
        )
        .toList()
    );
  }
}
