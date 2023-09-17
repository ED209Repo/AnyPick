import 'package:flutter/material.dart';
import 'Add_Vehicle_Page.dart';

class VehicleManagementPage extends StatefulWidget {
  final List<Map<String, String>> vehicleList;

  const VehicleManagementPage({Key? key, required this.vehicleList}) : super(key: key);

  @override
  _VehicleManagementPageState createState() => _VehicleManagementPageState();
}

class _VehicleManagementPageState extends State<VehicleManagementPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Text(
                    'Vehicle Management',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 48.0),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: widget.vehicleList.length + 1, // Add 1 for the button
                itemBuilder: (context, index) {
                  if (index == widget.vehicleList.length) {
                    // Display the button at the end
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextButton(
                        onPressed: () async {
                          final newVehicleData = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddVehiclePage(
                                onVehicleAdded: (Map<String, String> vehicleData) {
                                  if (vehicleData != null) {
                                    setState(() {
                                      widget.vehicleList.add(vehicleData);
                                    });
                                  }
                                },
                              ),
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            Icon(Icons.add, color: Color(0xFFF5A896), ),
                            SizedBox(width: 8),
                            Text(
                              "Add Your Vehicle",
                              style: TextStyle(color: Color(0xFFF5A896), ),
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    final vehicle = widget.vehicleList[index];
                    return ListTile(
                      leading: Icon(Icons.directions_car),
                      title: Text(vehicle['plateNumber'] ?? ''),
                      subtitle: Text('${vehicle['vehicleName']} - ${vehicle['color']}'),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: VehicleManagementPage(vehicleList: []),
    ),
  );
}
