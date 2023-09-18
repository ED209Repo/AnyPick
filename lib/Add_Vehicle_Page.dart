import 'package:flutter/material.dart';
import 'Widgets/AppColors.dart';

class AddVehiclePage extends StatefulWidget {
  final Function(Map<String, String> vehicleData) onVehicleAdded;

  const AddVehiclePage({Key? key, required this.onVehicleAdded}) : super(key: key);

  @override
  _AddVehiclePageState createState() => _AddVehiclePageState();
}

class _AddVehiclePageState extends State<AddVehiclePage> {
  final TextEditingController plateNumberController = TextEditingController();
  final TextEditingController vehicleNameController = TextEditingController();
  String selectedColor = 'Choose the color of your vehicle'; // Initial state

  // Color options
  final List<Map<String, dynamic>> colorOptions = [
    {'name': 'White', 'color': Colors.white},
    {'name': 'Red', 'color': Colors.red},
    {'name': 'Blue', 'color': Colors.blue},
    {'name': 'Green', 'color': Colors.green},
    {'name': 'Yellow', 'color': Colors.yellow},
    {'name': 'Orange', 'color': Colors.orange},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.themeColor,
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Icon(Icons.arrow_back_ios_new,color: AppColors.whitetext),
        ),
      title: const Text("Add Vehicle"),
      centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextFormField(
                controller: plateNumberController, // Connect the controller
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.themeColor,
                      width: 3,
                    ),
                  ),
                  labelText: 'Plate Number',
                  labelStyle: TextStyle(
                    color: AppColors.blackColor,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20.0),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextFormField(
                controller: vehicleNameController, // Connect the controller
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.themeColor,
                      width: 3,
                    ),
                  ),
                  labelText: 'Vehicle Name',
                  labelStyle: TextStyle(
                    color: AppColors.blackColor,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            DropdownButtonFormField<Map<String, dynamic>>(
              value: null, // Initial state with no color selected
              onChanged: (value) {
                setState(() {
                  selectedColor = value!['name'] as String;
                });
              },
              items: colorOptions.map((color) {
                return DropdownMenuItem<Map<String, dynamic>>(
                  value: color,
                  child: Text(
                    color['name'] as String,
                    style: const TextStyle(color: Colors.black), // Color of the item
                  ),
                );
              }).toList(),
              hint: const Text(
                'Choose the color of your vehicle',
                style: TextStyle(color: Colors.black), // Color of the hint
              ), // Hint text
            ),
            const SizedBox(height: 20.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  final plateNumber = plateNumberController.text;
                  final vehicleName = vehicleNameController.text;
                  final colorName = selectedColor;
                  if (plateNumber.isEmpty ||
                      vehicleName.isEmpty ||
                      colorName == 'Choose the color of your vehicle') {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.red,
                        content: Text('Please fill in all fields.'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  } else {
                    final vehicleData = {
                      'plateNumber': plateNumber,
                      'vehicleName': vehicleName,
                      'color': colorName,
                    };
                    widget.onVehicleAdded(vehicleData);
                    Navigator.pop(context);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF5A896), // Color change
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  minimumSize: Size(MediaQuery.of(context).size.width * 0.5, 0),
                ),
                child: const Text(
                  'Add Vehicle',
                  style: TextStyle(color: Colors.white), // Text color change
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}