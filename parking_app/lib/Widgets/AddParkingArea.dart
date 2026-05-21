// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:parking_app/Class.dart';
import 'package:parking_app/Widgets/Save.dart';

class AddParkingArea extends StatefulWidget {
  List<ParkingArea> toAdd;
  ParkingArea? toEdit;
  AddParkingArea({super.key, required this.toAdd, this.toEdit});

  @override
  State<AddParkingArea> createState() => _AddParkingAreaState();
}

class _AddParkingAreaState extends State<AddParkingArea> {
  final _formKey = GlobalKey<FormState>();
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
  void initState() {
    super.initState();
    if (widget.toEdit != null) {
      nameController.text = widget.toEdit!.name;
      locationController.text = widget.toEdit!.location;
      cityController.text = widget.toEdit!.city;
      totalSlotsController.text = widget.toEdit!.totalSlots.toString();
    }
  }

  void onAdd() {
    if (!_formKey.currentState!.validate()) return;

    if (widget.toEdit != null) {
      widget.toEdit!.name = nameController.text;
      widget.toEdit!.location = locationController.text;
      widget.toEdit!.city = cityController.text;

      int newSlots = int.parse(totalSlotsController.text);
      if (newSlots != widget.toEdit!.totalSlots) {
        widget.toEdit!.totalSlots = newSlots;
        widget.toEdit!.availableSlots = newSlots;
        widget.toEdit!.parkingSlots = [];
        for (int i = 1; i <= newSlots; i++) {
          widget.toEdit!.parkingSlots.add(
            ParkingSlot(slotNumber: "S$i", isAvailable: true),
          );
        }
      }
    } else {
      widget.toAdd.add(
        ParkingArea(
          name: nameController.text,
          location: locationController.text,
          city: cityController.text,
          totalSlots: int.parse(totalSlotsController.text),
        ),
      );
    }

    saveData(widget.toAdd);
    Navigator.pop(context);
  }

  Widget _buildTextField(
    String label,
    TextEditingController controller, [
    bool isNumber = false,
  ]) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFF1565C0),
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: isNumber ? TextInputType.number : TextInputType.text,
          validator: (value) {
            if (value == null || value.isEmpty) return 'Required';
            if (isNumber && int.tryParse(value) == null)
              return 'Must be a valid number';
            return null;
          },
          decoration: InputDecoration(
            hintText: label,
            hintStyle: const TextStyle(color: Colors.grey),
            filled: true,
            fillColor: Colors.grey.shade100,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Color(0xFF1565C0),
                width: 1.5,
              ),
            ),
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 24.0,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  // Custom Header
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Color(0xFF1565C0),
                          size: 28,
                        ),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                      Expanded(
                        child: Text(
                          widget.toEdit != null
                              ? "Edit Parking Area"
                              : "Add New Parking Area",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1565C0),
                          ),
                        ),
                      ),
                      const SizedBox(width: 28), // Balance the row
                    ],
                  ),
                  const SizedBox(height: 40),

                  _buildTextField("Parking Name", nameController),
                  _buildTextField("Location", locationController),
                  _buildTextField("City", cityController),
                  _buildTextField("Total Slots", totalSlotsController, true),

                  const SizedBox(height: 16),

                  SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0088FF),
                        foregroundColor: Colors.white,
                        elevation: 4,
                        shadowColor: const Color(0xFF0088FF).withOpacity(0.5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(27),
                        ),
                      ),
                      onPressed: onAdd,
                      child: Text(
                        widget.toEdit != null
                            ? "Save Changes"
                            : "Add Parking Area",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
