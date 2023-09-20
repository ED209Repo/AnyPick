import 'package:anypickdemo/Widgets/AppColors.dart';
import 'package:flutter/material.dart';
import 'Add_Vehicle_Page.dart';

class VehicleManagementPage extends StatefulWidget {
  final List<Map<String, String>> vehicleList;

  VehicleManagementPage({required this.vehicleList});

  @override
  _VehicleManagementPageState createState() => _VehicleManagementPageState();
}


class _VehicleManagementPageState extends State<VehicleManagementPage> {
  List<Map<String, String>> vehicleList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.themeColor,
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Icon(Icons.arrow_back_ios_new,color: AppColors.whitetext),
        ),
      title: const Text("Vehicle  Management"),
      centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: vehicleList.length + 1,
                itemBuilder: (context, index) {
                  if (index == vehicleList.length) {
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
                                      vehicleList.add(vehicleData);
                                    });
                                  }
                                },
                              ),
                            ),
                          );
                        },
                        child: const Row(
                          children: [
                            Icon(Icons.add, color: Color(0xFFF5A896)),
                            SizedBox(width: 8),
                            Text(
                              "Add Your Vehicle",
                              style: TextStyle(color: Color(0xFFF5A896)),
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    final vehicle = vehicleList[index];
                    return ListTile(
                      leading: const Icon(Icons.directions_car),
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