// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

class FoodItem {
  final String imgUrl;
  final String title;
  final String description; // Added description property
  double price;

  FoodItem({
    required this.imgUrl,
    required this.title,
    required this.description,
    required this.price,
  });
}


// Sample food items
final List<FoodItem> currentItems = [
  FoodItem(
    imgUrl: 'images/hardees2.png',
    title: 'Zinger Burger',
    description: 'x1 Regular fries, x1 250ml drink.',
    price: 10.0,
  ),
  FoodItem(
    imgUrl: 'images/pizza2.png',
    title: 'Italian Pizza',
    description: 'Extra Large, Hot and Chilly.',
    price: 8.0,
  ),
  FoodItem(
    imgUrl: 'images/fries1.png',
    title: 'Regular fries',
    description: 'Crispy fries.',
    price: 5.0,
  ),

];

// class PaymentCard extends StatelessWidget {
//   final String cardNumber;
//   final String name;
//   final String type;
//
//   PaymentCard({
//     required this.cardNumber,
//     required this.name,
//     required this.type,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.all(16.0),
//       padding: EdgeInsets.all(16.0),
//       child: Column(
//         children: [
//           Row(
//             children: [
//               Icon(Icons.credit_card),
//               SizedBox(width: 16),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       cardNumber,
//                       style: TextStyle(fontSize: 16),
//                     ),
//                     Text('$name - $type', style: TextStyle(fontSize: 12)),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }