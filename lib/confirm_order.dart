// import 'package:anypickdemo/Widgets/AppColors.dart';
// import 'package:anypickdemo/order_placed.dart';
// import 'package:flutter/material.dart';
// import 'package:anypickdemo/Cart_model.dart';
// class ConfirmOrderScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: AppColors.themeColor2,
//         leading: GestureDetector(
//           onTap: () => Navigator.of(context).pop(),
//           child: Icon(Icons.arrow_back_ios_new, color: Colors.white), // Change icon color
//         ),
//         title: const Text("Confirm Order"),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             const SizedBox(height: 26),
//             Container(
//               margin: const EdgeInsets.symmetric(horizontal: 20),
//               child: _buildListWithBackground(currentItems),
//             ),
//             const SizedBox(height: 20),
//             const Divider(
//               color: Colors.grey,
//               thickness: 1.0,
//               indent: 25,
//               endIndent: 25,
//             ),
//             _buildOrderSummary(),
//             const SizedBox(height: 10),
//             const Divider(
//               color: Colors.grey,
//               thickness: 1.0,
//               indent: 25,
//               endIndent: 25,
//             ),
//             Align(
//               alignment: FractionalOffset.bottomCenter,
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16), // Adjust the horizontal padding as needed
//                 child: Container(
//                   height: 47, // Set the desired height
//                   width: 400, // Use double.infinity for full width
//                   child: ElevatedButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => OrderPlacedScreen(),
//                         ),
//                       );
//                     },
//                     child: const Text(
//                       'Checkout',
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     style: ButtonStyle(
//                       foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
//                       backgroundColor: MaterialStateProperty.all<Color>(AppColors.themeColor2), // Change to your preferred color
//                       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                         RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildListWithBackground(List<FoodItem> items) {
//     return Container(
//       decoration: BoxDecoration(
//         color: AppColors.themeColor2.withOpacity(0.2),
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: FoodItemList(items: items), // Use the FoodItemList widget here
//     );
//   }
//
//   Widget _buildOrderSummary() {
//     // You can calculate sub total, tax, and total here based on the items
//     double subTotal = currentItems.map((item) => item.price).reduce((a, b) => a + b);
//     double tax = subTotal * 0.1;
//     double total = subTotal + tax;
//
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 10),
//       padding: const EdgeInsets.symmetric(vertical: 10),
//       decoration: BoxDecoration(
//         color: AppColors.themeColor2.withOpacity(0.2),
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Column(
//         children: [
//           _buildOrderSummaryItem("Sub Total", " ${subTotal.toStringAsFixed(2)}"),
//           _buildOrderSummaryItem("Tax", " ${tax.toStringAsFixed(2)}"),
//           _buildOrderSummaryItem("Total", "SR ${total.toStringAsFixed(2)}", isTotal: true),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildOrderSummaryItem(String title, String value, {bool isTotal = false}) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16), // Add horizontal padding
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             title,
//             style: TextStyle(
//               fontWeight: isTotal ? FontWeight.bold : FontWeight.normal, // Apply bold font weight for "Total"
//               fontSize: isTotal ? 16.0 : 14.0, // Adjust the font size as needed
//             ),
//           ),
//           Text(
//             value,
//             style: TextStyle(
//               fontWeight: isTotal ? FontWeight.bold : FontWeight.normal, // Apply bold font weight for "Total"
//               fontSize: isTotal ? 16.0 : 14.0, // Adjust the font size as needed
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
// class FoodItemList extends StatelessWidget {
//   final List<FoodItem> items;
//
//   FoodItemList({required this.items});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: items.map((item) {
//         return Column(
//           children: [
//             ListTile(
//               contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//               leading: ClipOval(
//                 child: Image.asset(
//                   item.imgUrl,
//                   width: 56,
//                   height: 56,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               title: Text(item.title),
//               subtitle: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(item.description),
//                 ],
//               ),
//               trailing: Text('SR${item.price.toStringAsFixed(2)}'),
//             ),
//             const Divider(
//               color: Colors.white,
//               thickness: 1.0,
//               indent: 16,
//               endIndent: 16,
//             ),
//           ],
//         );
//       }).toList(),
//     );
//   }
// }