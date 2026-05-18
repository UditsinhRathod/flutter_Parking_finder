class ParkingSlot {
  final String slotNumber;
  final bool isAvailable;

  ParkingSlot({required this.slotNumber, required this.isAvailable});
}

class ParkingArea {
  final String name;
  final String location;
  final String city;
  final int totalSlots;
  final int availableSlots;
  final List<ParkingSlot> parkingSlots;

  ParkingArea({
    required this.name,
    required this.location,
    required this.city,
    required this.totalSlots,
    required this.availableSlots,
    required this.parkingSlots,
  });
}