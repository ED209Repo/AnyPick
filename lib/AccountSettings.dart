import 'package:flutter/material.dart';
import 'ProfileSetting.dart';
import 'VehicleManagement.dart';

class AccountSettingsPage extends StatefulWidget {
  const AccountSettingsPage({Key? key}) : super(key: key);

  @override
  _AccountSettingsPageState createState() => _AccountSettingsPageState();
}

class _AccountSettingsPageState extends State<AccountSettingsPage> {
  // Initialize selected values for notifications
  bool pushNotifications = false;
  bool smsNotifications = true; // Default to "On"
  bool promotionalNotifications = false;

  // Map notification types to their respective icons
  final Map<String, IconData> notificationIcons = {
    'Push Notifications': Icons.notifications,
    'SMS Notifications': Icons.message,
    'Promotional Notifications': Icons.local_offer,
  };

  // Define custom color F5A896
  final Color customColor = const Color(0xFFF5A896);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: <Widget>[
            // Back Button and Heading Row
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.black, // Use custom color
                    ),
                    onPressed: () {
                      // Navigate back to the previous screen
                      Navigator.pop(context);
                    },
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Account Settings',
                        style: TextStyle(
                          fontSize: 32.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Description
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Update your settings like Notifications, payments, profile edit, etc.',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            // Add some gap
            const SizedBox(height: 20),

            // Sections and Radio Buttons (On/Off)
            buildListItemWithForwardButton(
              'Personal Info',
              Icons.person,
              'Change your account information',
                  () {
                // Navigate to the ProfileSettingsPage when the item is tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileSettingsPage(),
                  ),
                );
              },
            ),
            buildListItemWithForwardButton(
              'Payment Methods',
              Icons.payment,
              'Manage your payment methods',
                  () {
                // Handle the item tap action here
              },
            ),
            buildListItemWithForwardButton(
              'Locations',
              Icons.location_on,
              'Manage your saved locations',
                  () {
                // Handle the item tap action here
              },
            ),
            buildListItemWithForwardButton(
              'Vehicle Management',
              Icons.directions_car,
              'Manage your vehicles',
                  () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VehicleManagementPage(vehicleList: []),
                  ),
                );
                // Handle the item tap action here
              },
            ),
            ListTile(
              title: Text('Notifications'),
            ),
            // Notifications with Toggle Buttons (On/Off)
            buildNotificationTile(
              'Push Notifications',
              pushNotifications,
                  (bool value) {
                setState(() {
                  pushNotifications = value;
                });
              },
              'Receive push notifications',
            ),
            buildNotificationTile(
              'SMS Notifications',
              smsNotifications,
                  (bool value) {
                setState(() {
                  smsNotifications = value;
                });
              },
              'Receive SMS notifications',
            ),
            buildNotificationTile(
              'Promotional Notifications',
              promotionalNotifications,
                  (bool value) {
                setState(() {
                  promotionalNotifications = value;
                });
              },
              'Receive promotional notifications',
            ),
            ListTile(
              title: Text('More'),
            ),
            // Add forward buttons to other items
            buildListItemWithForwardButton(
              'Rate Us',
              Icons.star,
              'Rate our app',
                  () {
                // Handle the item tap action here
              },
            ),
            buildListItemWithForwardButton(
              'FAQ',
              Icons.help,
              'Frequently asked questions',
                  () {
                // Handle the item tap action here
              },
            ),
            ListTile(
              leading: Icon(Icons.logout, color: customColor), // Use custom color
              title: Text('Logout'),
              subtitle: Text('Sign out of your account'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildNotificationTile(
      String title,
      bool value,
      ValueChanged<bool> onChanged,
      String description,
      ) {
    return ListTile(
      leading: Icon(
        notificationIcons[title],
        color: customColor, // Use custom color
      ),
      title: Text(title),
      subtitle: Text(description),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
        activeTrackColor: customColor, // Use custom color for active track
        activeColor: Colors.white, // Use white color for the thumb
      ),
    );
  }

  // Helper method to build list items with forward buttons, descriptions, and onTap function
  Widget buildListItemWithForwardButton(String title, IconData icon, String description, VoidCallback onTap) {
    return ListTile(
      leading: Icon(
        icon,
        color: customColor, // Use custom color
      ),
      title: Text(title),
      subtitle: Text(description),
      trailing: Icon(
        Icons.arrow_forward_ios, // Use custom color for the forward button
      ),
      onTap: onTap,
    );
  }
}
