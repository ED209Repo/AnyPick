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
// }
// import 'package:flutter/material.dart';
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
//     var remainingHeight =
//         (screenHeight - (appBarHeight + statusBarHeight)) / 4;
//     remainingHeight -= 47.8;
//
//     return Container(
//       clipBehavior: Clip.hardEdge,
//       decoration: BoxDecoration(
//         borderRadius: const BorderRadius.all(Radius.circular(20)),
//         color: AppColors.themeColor2,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.2),
//             spreadRadius: 3,
//             blurRadius: 7,
//             offset: const Offset(0, 3),
//           ),
//         ],
//       ),
//       alignment: Alignment.center,
//       child: Stack(
//         children: [
//           Positioned(
//             top: 10, // Adjust this value as needed
//             left: 10, // Adjust this value as needed
//             child: Container(
//               width: 100,
//               height: 100,
//               child: ClipOval(
//                 child: Image.network(widget.restaurant.imageUrl),
//               ),
//             ),
//           ),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       widget.restaurant.name,
//                       style: const TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 30,
//                       ),
//                     ),
//                     const SizedBox(height: 5),
//                     Text(
//                       widget.restaurant.job,
//                       style: TextStyle(
//                         color: AppColors.whitetext,
//                         fontSize: 20,
//                       ),
//                     ),
//                     const SizedBox(height: 5),
//                     Text(
//                       widget.restaurant.city,
//                       style: TextStyle(
//                         color: AppColors.whitetext,
//                         fontSize: 15,
//                       ),
//                     ),
//                     const SizedBox(height: 5),
//                     Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         IconButton(
//                           onPressed: () {
//                             setState(() {
//                               widget.restaurant.likeCount++;
//                             });
//                           },
//                           icon: Icon(
//                             widget.restaurant.likeIcons,
//                             color: Colors.blue,
//                           ),
//                         ),
//                         const SizedBox(width: 5),
//                         Text(
//                           widget.restaurant.likeCount.toString(),
//                           style: const TextStyle(fontSize: 16, color: Colors.black),
//                         ),
//                         const SizedBox(width: 20),
//                         IconButton(
//                           onPressed: () {
//                             setState(() {
//                               widget.restaurant.heartCount++;
//                             });
//                           },
//                           icon: Icon(
//                             widget.restaurant.heartIcon,
//                             color: Colors.red,
//                           ),
//                         ),
//                         const SizedBox(width: 5),
//                         Text(
//                           widget.restaurant.heartCount.toString(),
//                           style: const TextStyle(fontSize: 16, color: Colors.black),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 18),
//               // FractionallySizedBox(
//               //   widthFactor: 1,
//               //   child: Container(
//               //     decoration: const BoxDecoration(
//               //       color: Colors.black12,
//               //       borderRadius: BorderRadius.only(
//               //         topLeft: Radius.circular(12),
//               //         topRight: Radius.circular(12),
//               //       ),
//               //     ),
//               //     height: 35,
//               //     width: 500,
//               //     child: Center(
//               //       child: Text(
//               //         "Top Picks",
//               //         style: TextStyle(
//               //           fontSize: 20,
//               //           fontWeight: FontWeight.bold,
//               //           color: AppColors.whitetext,
//               //         ),
//               //       ),
//               //     ),
//               //   ),
//               // ),
//               // Expanded(
//               //   child: Container(
//               //     decoration: BoxDecoration(
//               //       image: DecorationImage(
//               //         image: NetworkImage(widget.restaurant.backgroundImage),
//               //         fit: BoxFit.cover,
//               //       ),
//               //     ),
//               //     child: Padding(
//               //       padding: const EdgeInsets.only(
//               //         left: 25,
//               //         right: 25,
//               //         top: 25,
//               //         bottom: 18,
//               //       ),
//               //       child: LayoutBuilder(
//               //         builder: (BuildContext context, BoxConstraints constraints) {
//               //           return ListView.builder(
//               //             itemCount: widget.restaurant.dealNames.length,
//               //             itemBuilder: (context, index) {
//               //               var dealName = widget.restaurant.dealNames[index];
//               //               var dealImage = widget.restaurant.dealImage[index];
//               //               var isSelected = selectedDeals.contains(CartItem(dealName, dealImage));
//               //               return Container(
//               //                 height: remainingHeight,
//               //                 decoration: BoxDecoration(
//               //                   backgroundBlendMode: BlendMode.dstOver,
//               //                   borderRadius: BorderRadius.circular(12.0),
//               //                   gradient: LinearGradient(
//               //                     begin: Alignment.topCenter,
//               //                     end: Alignment.bottomCenter,
//               //                     colors: widget.restaurant.color,
//               //                   ),
//               //                 ),
//               //                 child: Row(
//               //                   children: <Widget>[
//               //                     const SizedBox(width: 12),
//               //                     Container(
//               //                       width: 55.0,
//               //                       height: 50.0,
//               //                       decoration: BoxDecoration(
//               //                         borderRadius: BorderRadius.circular(12.0),
//               //                       ),
//               //                       child: ClipRRect(
//               //                         borderRadius: BorderRadius.circular(12.0),
//               //                         child: Image.network(dealImage),
//               //                       ),
//               //                     ),
//               //                     const SizedBox(width: 16.0),
//               //                     Container(
//               //                       width: 150,
//               //                       child: Text(
//               //                         dealName,
//               //                         style: const TextStyle(
//               //                           color: Colors.white,
//               //                           fontSize: 20.0,
//               //                         ),
//               //                       ),
//               //                     ),
//               //                     const Spacer(),
//               //                     IconButton(
//               //                       onPressed: () {
//               //                         setState(() {
//               //                           if (isSelected) {
//               //                             selectedDeals.add(CartItem(dealName, dealImage));
//               //                           } else {
//               //                             selectedDeals.remove(CartItem(dealName, dealImage));
//               //                           }
//               //                         });
//               //                       },
//               //                       icon: Icon(
//               //                         isSelected ? Icons.shopping_cart : Icons.shopping_cart_outlined,
//               //                         color: Colors.white,
//               //                         size: 28.0,
//               //                       ),
//               //                     ),
//               //                     const SizedBox(width: 22,)
//               //                   ],
//               //                 ),
//               //               );
//               //             },
//               //           );
//               //         },
//               //       ),
//               //     ),
//               //   ),
//               // ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
