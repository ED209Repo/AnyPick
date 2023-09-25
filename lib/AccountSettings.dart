import 'package:anypickdemo/Widgets/AppColors.dart';
import 'package:flutter/material.dart';
import 'ProfileSetting.dart';
import 'VehicleManagement.dart';
import 'New_Payment_Page.dart';
import 'Language_Page.dart';
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
      appBar: AppBar(
        backgroundColor: AppColors.themeColor,
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Icon(Icons.arrow_back_ios_new,color: AppColors.whitetext),
        ),
      title: const Text("Account Settings"),
      centerTitle: true,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: <Widget>[
            const SizedBox(height: 10),
            buildListItemWithForwardButton(
              'Personal Info',
              Icons.person,
              'Change your account information',
                  () {
                // Navigate to the ProfileSettingsPage when the item is tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfileSettingsPage(),
                  ),
                );
              },
            ),
            buildListItemWithForwardButton(
              'Payment Methods',
              Icons.payment,
              'Manage your payment methods',
                  () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentMethodPage(paymentMethods: []), // Initialize with your payment methods data
                  ),
                );
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
             buildListItemWithForwardButton(
              'Order History',
              Icons.history,
              'View Your Order History and Details ',
                  () {
                // Handle the item tap action here
              },
            ),
            const ListTile(
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
            const ListTile(
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
            buildListItemWithForwardButton(
              'Language', // New "Language" option
              Icons.language, // Use the language icon
              'Change app language', // Description
                  () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  LanguagePage(),
                  ),
                );
                // Handle the item tap action here
              },
            ),
            ListTile(
              leading: Icon(Icons.logout, color: customColor), // Use custom color
              title: const Text('Logout'),
              subtitle: const Text('Sign out of your account'),
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
      trailing: const Icon(
        Icons.arrow_forward_ios, // Use custom color for the forward button
      ),
      onTap: onTap,
    );
  }
}
