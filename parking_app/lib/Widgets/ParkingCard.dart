import 'package:flutter/material.dart';
import 'package:parking_app/Class.dart';

class ParkingCard extends StatefulWidget {
  ParkingArea parkingArea;
  List<ParkingArea> getParkingAreas;
  VoidCallback onDeleteCallback;
  ParkingCard({
    super.key,
    required this.parkingArea,
    required this.getParkingAreas,
    required this.onDeleteCallback,
  });

  @override
  State<ParkingCard> createState() => _ParkingCardState();
}

class _ParkingCardState extends State<ParkingCard> {
  void onDelete() {
    widget.onDeleteCallback();
  }

  void onEdit() {
    Navigator.pushNamed(
      context,
      "/AddParkingArea",
      arguments: {
        'toAdd': widget.getParkingAreas,
        'toEdit': widget.parkingArea,
      },
    ).then((_) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              spacing: 10,
              children: [
                Expanded(
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(widget.parkingArea.name),
                    subtitle: Text(
                      '${widget.parkingArea.location}, ${widget.parkingArea.city}',
                    ),
                  ),
                ),

                Spacer(),

                IconButton(
                  onPressed: onDelete,
                  icon: Icon(Icons.delete_outline),
                ),

                IconButton(onPressed: onEdit, icon: Icon(Icons.edit)),
              ],
            ),

            // Header
            Center(
              child: Text(
                "PARKING SLOTS",
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 10),

            Wrap(
              spacing: 8,
              runAlignment: WrapAlignment.center,
              runSpacing: 8,
              children: widget.parkingArea.parkingSlots.map((slot) {
                return GestureDetector(
                  onTap: () => setState(() {
                    slot.isAvailable = !slot.isAvailable;
                    widget.parkingArea.resetCount();
                  }),

                  child: Container(
                    width: 54,
                    height: 40,
                    decoration: BoxDecoration(
                      color: slot.isAvailable
                          ? Colors.green.withOpacity(0.2)
                          : Colors.red.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: slot.isAvailable ? Colors.green : Colors.red,
                        width: 1.5,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      slot.slotNumber,
                      style: TextStyle(
                        color: slot.isAvailable ? Colors.green : Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),

            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Color(0xFF1565C0), width: 2),
                gradient: LinearGradient(
                  colors: [
                    Colors.white,
                    Color.fromARGB(255, 114, 151, 194),
                    Colors.white,
                  ],
                ),
              ),

              child: Row(
                children: [
                  Expanded(
                    child: ListTile(
                      title: Text("Total"),
                      subtitle: Text('${widget.parkingArea.totalSlots}'),
                    ),
                  ),
                  Spacer(),
                  Expanded(
                    child: ListTile(
                      title: Text("Available"),
                      subtitle: Text('${widget.parkingArea.availableSlots}'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
