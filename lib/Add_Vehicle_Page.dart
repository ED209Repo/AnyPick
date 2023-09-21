import 'package:fast_color_picker/fast_color_picker.dart';
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
  Color selectedColor = Colors.white; // Initial state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.themeColor,
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Icon(Icons.arrow_back_ios_new, color: AppColors.whitetext),
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
            // Color picker
            Container(
              width: MediaQuery.of(context).size.width,
              child: FastColorPicker(
                selectedColor: selectedColor,
                onColorSelected: (Color color) {
                  setState(() {
                    selectedColor = color;
                  });
                },
              ),
            ),

            const SizedBox(height: 20.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  final plateNumber = plateNumberController.text;
                  final vehicleName = vehicleNameController.text;
                  final colorName = selectedColor.toString();
                  if (plateNumber.isEmpty || vehicleName.isEmpty) {
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
