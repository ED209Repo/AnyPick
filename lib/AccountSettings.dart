import 'package:anypickdemo/NewHomeScreen.dart';
import 'package:anypickdemo/Widgets/AppColors.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'ProfileSetting.dart';
import 'VehicleManagement.dart';
import 'New_Payment_Page.dart';
import 'Language_Page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/cupertino.dart';
class AccountSettingsPage extends StatefulWidget {
  const AccountSettingsPage({Key? key}) : super(key: key);
  @override
  _AccountSettingsPageState createState() => _AccountSettingsPageState();
}

class _AccountSettingsPageState extends State<AccountSettingsPage> {
  final TextEditingController phoneController = TextEditingController();
  // TextEditingController _usernameController = TextEditingController();
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

  logout() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.remove('phoneNumber');
     await preferences.remove('username');
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
          return <Widget>[
            const CupertinoSliverNavigationBar(
              backgroundColor: Color(0xFFF5A896),
              largeTitle: Text('Profile', style: TextStyle(
                color: Colors.white,
              ),),
            )
          ];
        },
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: <Widget>[
            const SizedBox(height:0.1),
            buildListItemWithForwardButton(
              AppLocalizations.of(context)!.personalinfo,
              Icons.person,
              AppLocalizations.of(context)!.changeyouraccountinfo,
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
              AppLocalizations.of(context)!.paymentmethods,
              Icons.payment,
              AppLocalizations.of(context)!.manageyourmethod,
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
              AppLocalizations.of(context)!.location,
              Icons.location_on,
              AppLocalizations.of(context)!.manageyoursavelocation,
                  () {
                // Handle the item tap action here
              },
            ),
            buildListItemWithForwardButton(
              AppLocalizations.of(context)!.vehiclemanagement,
              Icons.directions_car,
              AppLocalizations.of(context)!.manageyourvehicle,
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
               AppLocalizations.of(context)!.orderhistory,
              Icons.history,
               AppLocalizations.of(context)!.viewyourorderhistory,
                  () {
                // Handle the item tap action here
              },
            ),
             ListTile(
              title: Text(AppLocalizations.of(context)!.notifications),
            ),
            // Notifications with Toggle Buttons (On/Off)
            buildNotificationTile(
              AppLocalizations.of(context)!.pushNotification,
              pushNotifications,
                  (bool value) {
                setState(() {
                  pushNotifications = value;
                });
              },
              AppLocalizations.of(context)!.recievePushnotification,
            ),
             ListTile(
              title: Text(AppLocalizations.of(context)!.more),
            ),
            // Add forward buttons to other items
            buildListItemWithForwardButton(
              AppLocalizations.of(context)!.rateus,
              Icons.star,
              AppLocalizations.of(context)!.rateourapp,
                  () {
                // Handle the item tap action here
              },
            ),
            buildListItemWithForwardButton(
              AppLocalizations.of(context)!.faq,
              Icons.help,
              AppLocalizations.of(context)!.frequentlyaskedquestions,
                  () {
                // Handle the item tap action here
              },
            ),
            buildListItemWithForwardButton(
              AppLocalizations.of(context)!.language, // New "Language" option
              Icons.language, // Use the language icon
              AppLocalizations.of(context)!.changeapplanguage, // Description
                  () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  LanguageSelectionPage(),
                  ),
                );
                // Handle the item tap action here
              },
            ),
            ListTile(
              leading: Icon(Icons.logout, color: customColor), // Use custom color
              title:  Text(AppLocalizations.of(context)!.logout),
              subtitle:  Text(AppLocalizations.of(context)!.signoutyouraccount),
              onTap: () async {
  showDialog(context: context,
      builder: (BuildContext context){
    return AlertDialog(
      backgroundColor: AppColors.themeColor,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
      title:  Text(AppLocalizations.of(context)!.logout,
      style: const TextStyle(
        color: Colors.white
      ),),
      content:  Text(AppLocalizations.of(context)!.areyousurewanttologout,
      style: const TextStyle(
          color: Colors.white
      ),),
      actions: [
        TextButton(
          child:  Text(AppLocalizations.of(context)!.cancel,
          style: const TextStyle(
              color: Colors.grey,
          ),),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child:  Text(AppLocalizations.of(context)!.logout,
          style: const TextStyle(
              color: Colors.red
          ),),
          onPressed: () async {// Close the dialog
            await logout();
            CoolAlert.show(context: context, type: CoolAlertType.loading,
              text: AppLocalizations.of(context)!.loggedOutSuccessfull,
              autoCloseDuration: const Duration(milliseconds: 2000),
              lottieAsset: "images/signup.json",
              animType: CoolAlertAnimType.scale,
            );
            await Future.delayed(const Duration(milliseconds: 2000));
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          },
        ),
      ],
    );
      });

},
            ),
            const SizedBox(height: 15,),
            const Text("Version 1.1.1", textAlign: TextAlign.center,),
          ],
        ),
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
