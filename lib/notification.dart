// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:rxdart/subjects.dart';



// class NotificationService {
//   final FlutterLocalNotificationsPlugin _localNotifications =
//       FlutterLocalNotificationsPlugin();
//   final BehaviorSubject<String> behaviorSubject = BehaviorSubject();
//   final BuildContext context;

//   NotificationService(this.context);

//   Future<void> initializePlatformNotifications() async {
//     const AndroidInitializationSettings initializationSettingsAndroid =
//         AndroidInitializationSettings('ic_stat_justwater');

//     // Use the correct import for IOSInitializationSettings
//     final IOSInitializationSettings initializationSettingsIOS =
//         IOSInitializationSettings(
//       requestSoundPermission: true,
//       requestBadgePermission: true,
//       requestAlertPermission: true,
//       onDidReceiveLocalNotification: onDidReceiveLocalNotification,
//     );

//     final InitializationSettings initializationSettings =
//         InitializationSettings(
//       android: initializationSettingsAndroid,
//       iOS: initializationSettingsIOS,
//     );

//     await _localNotifications.initialize(initializationSettings,
//         onSelectNotification: selectNotification);
//   }

//   void onDidReceiveLocalNotification(
//       int id, String? title, String? body, String? payload) {
//     print('id $id');
//   }

//   void selectNotification(String? payload) {
//     if (payload != null && payload.isNotEmpty) {
//       behaviorSubject.add(payload);
//     }
//   }

//   Future<NotificationDetails> _notificationDetails() async {
//     final bigPicture = await DownloadUtil.downloadAndSaveFile(
//         "https://images.unsplash.com/photo-1624948465027-6f9b51067557?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80",
//         "drinkwater");

//     AndroidNotificationDetails androidPlatformChannelSpecifics =
//         AndroidNotificationDetails(
//       'channel id',
//       'channel name',
//       groupKey: 'com.example.flutter_push_notifications',
//       channelDescription: 'channel description',
//       importance: Importance.max,
//       priority: Priority.max,
//       playSound: true,
//       ticker: 'ticker',
//       largeIcon: const DrawableResourceAndroidBitmap('justwater'),
//       styleInformation: BigPictureStyleInformation(
//         FilePathAndroidBitmap(bigPicture),
//         hideExpandedLargeIcon: false,
//       ),
//       color: const Color(0xff2196f3),
//     );

//     IOSNotificationDetails iosNotificationDetails = IOSNotificationDetails(
//         threadIdentifier: "thread1",
//         attachments: <IOSNotificationAttachment>[
//           IOSNotificationAttachment(bigPicture)
//         ]);

//     final details = await _localNotifications.getNotificationAppLaunchDetails();
//     if (details != null && details.didNotificationLaunchApp) {
//       behaviorSubject.add(details.payload!);
//     }
//     NotificationDetails platformChannelSpecifics = NotificationDetails(
//         android: androidPlatformChannelSpecifics, iOS: iosNotificationDetails);

//     return platformChannelSpecifics;
//   }

//   Future<void> showLocalNotification({
//     required int id,
//     required String title,
//     required String body,
//     required String payload,
//   }) async {
//     final platformChannelSpecifics = await _notificationDetails();
//     await _localNotifications.show(
//       id,
//       title,
//       body,
//       platformChannelSpecifics,
//       payload: payload,
//     );
//   }
// }

// class DownloadUtil {
//   static Future<String> downloadAndSaveFile(String url, String fileName) async {
//     // Implement your file download logic here
//     return 'path/to/downloaded/file';
//   }
// }

// class YourFirstScreen extends StatefulWidget {
//   @override
//   _YourFirstScreenState createState() => _YourFirstScreenState();
// }

// class _YourFirstScreenState extends State<YourFirstScreen> {
//   late final NotificationService notificationService;

//   @override
//   void initState() {
//     super.initState();
//     notificationService = NotificationService(context);
//     listenToNotificationStream();
//     notificationService.initializePlatformNotifications();
//   }

//   void listenToNotificationStream() =>
//       notificationService.behaviorSubject.listen((payload) {
//         Navigator.push(
//             context,
//             MaterialPageRoute(
//                 builder: (context) => YourSecondScreen(payload: payload)));
//       });

//   @override
//   Widget build(BuildContext context) {
//     // Your first screen widget build code here
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Your First Screen'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             // Trigger the notification for testing
//             notificationService.showLocalNotification(
//               id: 1,
//               title: 'Notification Title',
//               body: 'Notification Body',
//               payload: 'Your payload data',
//             );
//           },
//           child: Text('Show Notification'),
//         ),
//       ),
//     );
//   }
// }

// class YourSecondScreen extends StatelessWidget {
//   final String payload;

//   const YourSecondScreen({Key? key, required this.payload}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // Your second screen widget build code here
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Your Second Screen'),
//       ),
//       body: Center(
//         child: Text('Payload: $payload'),
//       ),
//     );
//   }
// }

// void main() {
//   runApp(MaterialApp(
//     home: YourFirstScreen(),
//   ));
// }
