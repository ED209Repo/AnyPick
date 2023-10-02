// import 'package:flutter/material.dart';
//
// import 'ProductPageModel.dart';
//
// class FoodDetailPage extends StatelessWidget {
//   int heartCount = 0;
//   final Food food;
//   FoodDetailPage({required this.food});
//   @override
//   Widget build(BuildContext context) {
//     int quantity = 0; // Initial quantity
//     void incrementQuantity() {
//       if (quantity < 10) {
//         // Limit the maximum quantity to 10, for example
//         quantity++;
//       }
//     }
//     void decrementQuantity() {
//       if (quantity > 1) {
//         quantity--;
//       }
//     }
//     // void incrementHeartCount() {
//     //   setState(() {
//     //     heartCount++;
//     //   });
//     // }
//
//     Future<void> _showAddonOptionDialog(BuildContext context, String addonName) async {
//       final List<String> options = ['Option 1', 'Option 2', 'Option 3'];
//       String? selectedOption;
//       await showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return StatefulBuilder(
//             builder: (context, setState) {
//               return AlertDialog(
//                 title: Text('Select $addonName '),
//                 content: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: options.map((option) {
//                     return ListTile(
//                       title: Text(option),
//                       leading: Radio<String>(
//                         value: option,
//                         groupValue: selectedOption,
//                         onChanged: (value) {
//                           setState(() {
//                             selectedOption = value;
//                           });
//                         },
//                       ),
//                     );
//                   }).toList(),
//                 ),
//                 actions: <Widget>[
//                   TextButton(
//                     onPressed: () {
//                       // Perform actions with the selected option here
//                       print('Selected $addonName Option: $selectedOption');
//                       Navigator.of(context).pop(); // Close dialog after saving
//                     },
//                     child: const Text('Save'),
//                   ),
//                 ],
//               );
//             },
//           );
//         },
//       );
//     }
//     return Scaffold(
//       backgroundColor: kBackground, // Use an appropriate color
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Container(
//               padding: EdgeInsets.only(
//                 top: MediaQuery.of(context).padding.top + 30,
//                 left: 25,
//                 right: 25,
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   GestureDetector(
//                     onTap: () => Navigator.pop(context),
//                     child: Container(
//                       padding: const EdgeInsets.all(8),
//                       decoration: const BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: Colors.white, // Use an appropriate color
//                       ),
//                       child: const Icon(Icons.arrow_back),
//                     ),
//                   ),
//                   Container(
//                     padding: const EdgeInsets.all(8),
//                     decoration: const BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: Colors.white, // Use an appropriate color
//                     ),
//                     child: const Icon(Icons.favorite_outline),
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               height: 230,
//               child: Stack(
//                 children: [
//                   Column(
//                     children: [
//                       Expanded(
//                         flex: 1,
//                         child: Container(),
//                       ),
//                       Expanded(
//                         flex: 1,
//                         child: Container(
//                           decoration: const BoxDecoration(
//                             borderRadius: BorderRadius.vertical(
//                               top: Radius.circular(50),
//                             ),
//                             color: kPrimaryColor, // Use an appropriate color
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   Align(
//                     alignment: Alignment.center,
//                     child: Container(
//                       margin: const EdgeInsets.all(15),
//                       width: 220,
//                       height: 220,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.red.withOpacity(0.2),
//                             offset: const Offset(-4, 10),
//                             blurRadius: 10,
//                           ),
//                         ],
//                       ),
//                       child: ClipOval(
//                         child: Image.asset(
//                           food.imgUrl!,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               padding: const EdgeInsets.all(25),
//               color: kPrimaryColor, // Use an appropriate color
//               child: Column(
//                 children: [
//                   Text(
//                     food.name!,
//                     style: const TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 22,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 15,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Row(
//                         children: [
//                           const Icon(
//                             Icons.access_time_outlined,
//                             color: Colors.blue,
//                           ),
//                           Text(
//                             food.waitTime!,
//                             style: const TextStyle(fontSize: 16),
//                           ),
//                           GestureDetector(
//                             //onTap: incrementHeartCount,
//                             child: Row(
//                               children: [
//                                 const Icon(
//                                   Icons.favorite,
//                                   color: Colors.red,
//                                   size: 30,
//                                 ),
//                                 const SizedBox(width: 4),
//                                 Text('$heartCount'),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 39,
//                   ),
//                   Container(
//                     width: double.maxFinite,
//                     height: 40,
//                     child: Stack(
//                       children: [
//                         Align(
//                           alignment: const Alignment(-0.5, 0),
//                           child: Container(
//                             height: 40,
//                             width: 120,
//                             decoration: BoxDecoration(
//                               color: Colors.grey.withOpacity(0.1),
//                               borderRadius: BorderRadius.circular(30),
//                             ),
//                             child: Row(
//                               children: [
//                                 const SizedBox(
//                                   width: 15,
//                                 ),
//                                 const Text(
//                                   'SR',
//                                   style: TextStyle(
//                                       fontSize: 13, fontWeight: FontWeight.bold),
//                                 ),
//                                 Text(
//                                   food.price.toString(),
//                                   style: const TextStyle(
//                                       fontSize: 20, fontWeight: FontWeight.bold),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         Align(
//                           alignment: Alignment.center,
//                           child: Container(
//                             height: 40,
//                             width: 100,
//                             decoration: BoxDecoration(
//                               color: Colors.blue, // Use an appropriate color
//                               borderRadius: BorderRadius.circular(30),
//                             ),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: [
//                                 GestureDetector(
//                                   onTap: decrementQuantity,
//                                   child: const Text(
//                                     '-',
//                                     style: TextStyle(
//                                         fontSize: 20, fontWeight: FontWeight.bold),
//                                   ),
//                                 ),
//                                 Text(
//                                   quantity.toString(),
//                                   style: const TextStyle(
//                                       fontSize: 20, fontWeight: FontWeight.bold),
//                                 ),
//                                 GestureDetector(
//                                   onTap: incrementQuantity,
//                                   child: const Text(
//                                     '+',
//                                     style: TextStyle(
//                                         fontSize: 20, fontWeight: FontWeight.bold),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   const Row(
//                     children: [
//                       Text(
//                         'Add-ons',
//                         style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
//                       )
//                     ],
//                   ),
//                   const SizedBox(height: 10),
//                   Container(
//                     height: 100,
//                     child: ListView.separated(
//                       scrollDirection: Axis.horizontal,
//                       itemBuilder: (context, index) {
//                         if (index < food.addons!.length) {
//                           final String addonName = food.addons![index].keys.first;
//                           return GestureDetector(
//                             onTap: () {
//                               if (food.addons != null &&
//                                   index < food.addons!.length) {
//                                 _showAddonOptionDialog(context, addonName);
//                               }
//                             },
//                             child: Container(
//                               padding: const EdgeInsets.all(10),
//                               decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 borderRadius: BorderRadius.circular(40),
//                               ),
//                               child: Column(
//                                 children: [
//                                   Image.asset(
//                                     food.addons![index].values.first,
//                                     width: 52,
//                                   ),
//                                   Text(addonName),
//                                 ],
//                               ),
//                             ),
//                           );
//                         } else {
//                           return const SizedBox();
//                         }
//                       },
//                       separatorBuilder: (_, index) => const SizedBox(
//                         width: 15,
//                       ),
//                       itemCount: food.addons != null ? food.addons!.length : 0,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 39,
//                   ),
//                   const SizedBox(height: 20),
//                   const Row(
//                     children: [
//                       Text(
//                         'About',
//                         style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 10),
//                   Text(
//                     food.about!,
//                     style: const TextStyle(fontSize: 16, wordSpacing: 1.2, height: 1.5),
//                   ),
//                   const SizedBox(height: 20),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: Container(
//         width: 100,
//         height: 56,
//         child: RawMaterialButton(
//           onPressed: () {},
//           fillColor: Colors.blue, // Use an appropriate color
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(50),
//           ),
//           elevation: 2,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               const Icon(
//                 Icons.shopping_bag_outlined,
//                 color: Colors.white, // Use an appropriate color
//                 size: 30,
//               ),
//               Container(
//                 padding: const EdgeInsets.all(15),
//                 decoration: const BoxDecoration(
//                   color: Colors.white, // Use an appropriate color
//                   shape: BoxShape.circle,
//                 ),
//                 child: Text(
//                   quantity.toString(),
//                   style: const TextStyle(
//                     color: Colors.black, // Use an appropriate color
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
//
