import 'package:anypickdemo/ProfileSetting.dart';
import 'package:anypickdemo/SplashScreen.dart';

import 'package:flutter/material.dart';
void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splashscreen(),
    ),
  );
}

//import 'package:flutter/material.dart';
// import 'Widgets/AppColors.dart'; // Make sure this import is correct.
// import 'card_candidate_model.dart'; // Make sure this import is correct.
//
// class ExampleCard extends StatefulWidget {
//   final ExampleResturantModel restaurant;
//   const ExampleCard(this.restaurant, {Key? key}) : super(key: key);
//
//   @override
//   _ExampleCardState createState() => _ExampleCardState();
// }
//
// class _ExampleCardState extends State<ExampleCard> {
//   final Set<CartItem> selectedDeals = {};
//
//   @override
//   Widget build(BuildContext context) {
//     final screenHeight = MediaQuery.of(context).size.height;
//     final appBarHeight = AppBar().preferredSize.height;
//     final statusBarHeight = MediaQuery.of(context).padding.top;
//     var remainingHeight = (screenHeight - (appBarHeight + statusBarHeight)) / 4;
//     remainingHeight -= 100;
//
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Container(
//           clipBehavior: Clip.hardEdge,
//           decoration: BoxDecoration(
//             borderRadius: const BorderRadius.only(
//               topLeft: Radius.circular(12),
//               topRight: Radius.circular(12),
//             ),
//             color: AppColors.themeColor2,
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.2),
//                 spreadRadius: 3,
//                 blurRadius: 7,
//                 offset: const Offset(0, 3),
//               ),
//             ],
//           ),
//           alignment: Alignment.center,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Stack(
//                 alignment: Alignment.topLeft,
//                 children: [
//                   Positioned(
//                     top: 10,
//                     left: 10,
//                     child: Padding(
//                       padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
//                       child: Container(
//                         width: 110,
//                         height: 110,
//                         child: const ClipOval(
//                           child: Image(image: AssetImage('images/mcdd.jpg')),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(120, 10, 16, 0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const SizedBox(height: 15),
//                             Center(
//                               child: Text(
//                                 widget.restaurant.name,
//                                 style: const TextStyle(
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 30,
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(height: 5),
//                             Center(
//                               child: Row(
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: [
//                                   IconButton(
//                                     onPressed: () {
//                                       setState(() {
//                                         widget.restaurant.likeCount++;
//                                       });
//                                     },
//                                     icon: Icon(
//                                       widget.restaurant.likeIcons,
//                                       color: Colors.blue,
//                                     ),
//                                   ),
//                                   const SizedBox(width: 5),
//                                   Text(
//                                     widget.restaurant.likeCount.toString(),
//                                     style: const TextStyle(
//                                       fontSize: 16,
//                                       color: Colors.black,
//                                     ),
//                                   ),
//                                   const SizedBox(width: 20),
//                                   IconButton(
//                                     onPressed: () {
//                                       setState(() {
//                                         widget.restaurant.heartCount++;
//                                       });
//                                     },
//                                     icon: Icon(
//                                       widget.restaurant.heartIcon,
//                                       color: Colors.red,
//                                     ),
//                                   ),
//                                   const SizedBox(width: 5),
//                                   Text(
//                                     widget.restaurant.heartCount.toString(),
//                                     style: const TextStyle(
//                                       fontSize: 16,
//                                       color: Colors.black,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 10), // Adjust spacing as needed
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(15, 0, 16, 0),
//                     // Adjust left padding as needed
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           widget.restaurant.city,
//                           style: TextStyle(
//                             color: AppColors.whitetext,
//                             fontSize: 20,
//                           ),
//                         ),
//                         Text(
//                           widget.restaurant.job,
//                           style: TextStyle(
//                             color: AppColors.whitetext,
//                             fontSize: 20,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 10), // Adjust spacing as needed
//             ],
//           ),
//         ),
//         FractionallySizedBox(
//           widthFactor: 1,
//           child: Container(
//             decoration: const BoxDecoration(
//               color: Colors.black,
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(12),
//                 topRight: Radius.circular(12),
//               ),
//             ),
//             height: 35,
//             width: 500,
//             child: Center(
//               child: Text(
//                 "Top Picks",
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                   color: AppColors.whitetext,
//                 ),
//               ),
//             ),
//           ),
//         ),
//         Expanded(
//           child: Container(
//             decoration: BoxDecoration(
//               borderRadius: const BorderRadius.only(
//                 topLeft: Radius.circular(12),
//                 topRight: Radius.circular(12),
//                 bottomLeft: Radius.circular(30),
//                 bottomRight: Radius.circular(30),
//               ),
//               color: Colors.grey,
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(0.2),
//                   spreadRadius: 3,
//                   blurRadius: 7,
//                   offset: const Offset(0, 3),
//                 ),
//               ],
//             ),
//             child: LayoutBuilder(
//               builder: (BuildContext context, BoxConstraints constraints) {
//                 return Padding(
//                   padding: const EdgeInsets.fromLTRB(22, 22, 22, 10),
//                   child: ListView.builder(
//                     itemCount: widget.restaurant.dealNames.length,
//                     itemBuilder: (context, index) {
//                       var dealName = widget.restaurant.dealNames[index];
//                       var dealImage = widget.restaurant.dealImage[index];
//                       var isSelected = selectedDeals.contains(CartItem(dealName, dealImage));
//                       return ExpansionTile(
//                         title: Container(
//                           decoration: BoxDecoration(
//                             color: Colors.black,
//                             border: Border.all(
//                               color: Colors.black, // You can change the border color here
//                               width: 1.0, // You can adjust the border width as needed
//                             ),
//                             borderRadius: BorderRadius.circular(12.0),
//                           ),
//                           padding: const EdgeInsets.all(8.0), // You can adjust the padding as needed
//                           child: Text(
//                               widget.restaurant.dealNames[index],
//                             style: const TextStyle(
//                               color: Colors.white, // Set the desired text color
//                               fontSize: 16.0, // You can adjust the font size as needed
//                             ),
//                           ),
//                         ),
//                         children: [
//                           Container(
//                             height: remainingHeight,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(12.0),
//                               color: Colors.black
//                               // gradient: LinearGradient(
//                               //   begin: Alignment.topCenter,
//                               //   end: Alignment.bottomCenter,
//                               //   colors: widget.restaurant.color,
//                               // ),
//                             ),
//                             child: Row(
//                               children: <Widget>[
//                                 const SizedBox(width: 12),
//                                 Container(
//                                   width: 55.0,
//                                   height: 50.0,
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(12.0),
//                                   ),
//                                   child: ClipRRect(
//                                     borderRadius: BorderRadius.circular(12.0),
//                                     child: Image.network(dealImage),
//                                   ),
//                                 ),
//                                 const SizedBox(width: 16.0),
//                                 Container(
//                                   width: 150,
//                                   child: Text(
//                                     dealName,
//                                     style: const TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 20.0,
//                                     ),
//                                   ),
//                                 ),
//                                 const Spacer(),
//                                 IconButton(
//                                   onPressed: () {
//                                     // Handle button press here
//                                   },
//                                   icon: Icon(
//                                     isSelected
//                                         ? Icons.shopping_cart
//                                         : Icons.shopping_cart_outlined,
//                                     color: Colors.white,
//                                     size: 28.0,
//                                   ),
//                                 ),
//                                 const SizedBox(width: 22,)
//                               ],
//                             ),
//                           ),
//                         ],
//                       );
//
//                     },
//                   ),
//                 );
//               },
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }