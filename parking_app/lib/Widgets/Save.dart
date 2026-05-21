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
