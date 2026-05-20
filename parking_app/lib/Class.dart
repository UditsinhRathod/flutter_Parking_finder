class ParkingSlot {
  final String slotNumber;
  bool isAvailable;

  ParkingSlot({required this.slotNumber, required this.isAvailable});
}

class ParkingArea {
  String name;
  String location;
  String city;
  int totalSlots;
  int? availableSlots;
  late List<ParkingSlot> parkingSlots;

  void resetCount() {
    availableSlots = parkingSlots
        .where((e) => e.isAvailable == true)
        .toList()
        .length;
  }

  ParkingArea({
    required this.name,
    required this.location,
    required this.city,
    required this.totalSlots,
  }) {
    availableSlots = totalSlots;
    parkingSlots = [];
    for (int i = 1; i <= totalSlots; i++) {
      parkingSlots.add(ParkingSlot(slotNumber: "S$i", isAvailable: true));
    }
  }
}
