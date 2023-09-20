import 'package:flutter/material.dart';
class CartItem {
  final String dealName;
  final String dealImage;

  CartItem(this.dealName, this.dealImage);
}

class ExampleResturantModel {
  String name;
  String job;
  String city;
  List<Color> color;
  String imageUrl;
  String backgroundImage;
  List<String> dealNames;
  List<String> dealImage;
  List<String> dealDescription;
  int price;
  var likeIcons;
  var heartIcon;
  int likeCount;
  int heartCount;
  int count;

  // test 123

  ExampleResturantModel({
    required this.name,
    required this.job,
    required this.city,
    required this.color,
    required this.imageUrl,
    required this.backgroundImage,
    required this.dealNames,
    required this.dealImage,
    required this.dealDescription,
    required this.price,
    required this.likeIcons,
    required this.heartIcon,
    required this.likeCount,
    required this.heartCount,
    this.count=0,
  });
}

final List<ExampleResturantModel> candidates = [
  ExampleResturantModel(
    name: 'Mcdonalds',
    job: 'Available till 11:00 pm',
    city: 'I-8',
    likeIcons: Icons.thumb_up, // Add the like icon here
    heartIcon: Icons.favorite, // Add the heart icon here
    likeCount: 0,
    heartCount: 0,
    color: const [Color(0xFFFF3868), Color(0xFFFFB49A)],
    imageUrl: 'images/mcdd.jpg',
    backgroundImage: 'images/kfc.jpg',
    price: 4,
    dealNames: [
      'Big Mac Combo Deal',
      'Chicken Sandwich Special',
      'Vegetarian Delight',
      'Dessert Paradise',
    ],
    dealImage: [
      'https://images.unsplash.com/photo-1619881589316-56c7f9e6b587?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8bWNkb25hbGRzfGVufDB8fDB8fHww&w=1000&q=80',
      'https://media.istockphoto.com/id/524304077/photo/mcdonalds-meal.jpg?s=612x612&w=0&k=20&c=K8D13dsJYseCVtkDljryrSoJ6XLD2NcX94OV_5onz3Q=',
      'https://i.ibb.co/WsB2tDb/Screenshot-2023-08-21-at-11-30-10-PM.png',
      'https://i.ibb.co/WsB2tDb/Screenshot-2023-08-21-at-11-30-10-PM.png',
    ],
    dealDescription: [
      'double layer of sear-sizzled 100% pure beef ',
      'sauce and melted cheese, diced onion, crisp shredded',
      'sauce and melted cheese, diced onion, crisp shredded',
      'double layer of sear-sizzled 100% pure beef ',
    ],
  ),
  ExampleResturantModel(
    name: 'KFC',
    job: 'Available till 11:59 pm',
    city: 'F-7',
    likeIcons: Icons.thumb_up, // Add the like icon here
    heartIcon: Icons.favorite,
    likeCount: 0,
    heartCount: 0,
    color: const [Color(0xFF736EFE), Color(0xFF62E4EC)],
    imageUrl: 'images/Kfc3.png',
    backgroundImage: 'images/kfc.jpg',
    price: 6,
    dealNames: [
      'Big Mac Combo Deal',
      'Chicken Sandwich Special',
      'Vegetarian Delight',
      'Dessert Paradise',
    ],
    dealImage: [
      'https://i.ibb.co/WsB2tDb/Screenshot-2023-08-21-at-11-30-10-PM.png',
      'https://i.ibb.co/WsB2tDb/Screenshot-2023-08-21-at-11-30-10-PM.png',
      'https://i.ibb.co/WsB2tDb/Screenshot-2023-08-21-at-11-30-10-PM.png',
      'https://i.ibb.co/WsB2tDb/Screenshot-2023-08-21-at-11-30-10-PM.png',
    ],
    dealDescription: [
      'double layer of sear-sizzled 100% pure beef ',
      'sauce and melted cheese, diced onion, crisp shredded',
      'sauce and melted cheese, diced onion, crisp shredded',
      'double layer of sear-sizzled 100% pure beef ',
    ],

  ),
  ExampleResturantModel(
    name: 'Hardees',
    job: 'Available till 1:00 Am',
    city: 'I-10',
    likeIcons: Icons.thumb_up, // Add the like icon here
    heartIcon: Icons.favorite,
    likeCount: 0,
    heartCount: 0,
    color: const [Color(0xFF2F80ED), Color(0xFF56CCF2)],
    imageUrl: 'images/kfc.jpg',
    backgroundImage: 'images/kfc.jpg',
    price: 8,
    dealNames: [
      'Big Mac Deal',
      'Chicken Sandwich Deal',
      'Vegetarian Delight',
      'Browine With ice cream',
    ],
    dealImage: [
      'https://i.ibb.co/WsB2tDb/Screenshot-2023-08-21-at-11-30-10-PM.png',
      'https://i.ibb.co/WsB2tDb/Screenshot-2023-08-21-at-11-30-10-PM.png',
      'https://i.ibb.co/WsB2tDb/Screenshot-2023-08-21-at-11-30-10-PM.png',
      'https://i.ibb.co/WsB2tDb/Screenshot-2023-08-21-at-11-30-10-PM.png',
    ],
    dealDescription: [
      'double layer of sear-sizzled 100% pure beef ',
      'sauce and melted cheese, diced onion, crisp shredded',
      'sauce and melted cheese, diced onion, crisp shredded',
      'double layer of sear-sizzled 100% pure beef ',
    ],
  ),
  ExampleResturantModel(
    name: 'Burger Lab',
    job: 'Available till 11:00 pm',
    city: 'F-10',
    likeIcons: Icons.thumb_up, // Add the like icon here
    heartIcon: Icons.favorite,
    likeCount: 0,
    heartCount: 0,
    color: const [Color(0xFF0BA4E0), Color(0xFFA9E4BD)],
    imageUrl: 'images/kfc.jpg',
    backgroundImage: 'images/kfc.jpg',
    price: 4,
    dealNames: [
      'Big Mac Combo Deal',
      'Chicken Sandwich Special',
      'Vegetarian Delight',
      'Dessert Paradise',
    ],
    dealImage: [
      'https://i.ibb.co/WsB2tDb/Screenshot-2023-08-21-at-11-30-10-PM.png',
      'https://i.ibb.co/WsB2tDb/Screenshot-2023-08-21-at-11-30-10-PM.png',
      'https://i.ibb.co/WsB2tDb/Screenshot-2023-08-21-at-11-30-10-PM.png',
      'https://i.ibb.co/WsB2tDb/Screenshot-2023-08-21-at-11-30-10-PM.png',
    ],
    dealDescription: [
      'double layer of sear-sizzled 100% pure beef ',
      'sauce and melted cheese, diced onion, crisp shredded',
      'sauce and melted cheese, diced onion, crisp shredded',
      'double layer of sear-sizzled 100% pure beef ',
    ],

  ),
  ExampleResturantModel(
    name: 'Gloria Jeans',
    job: 'Available till 2:00 Am',
    city: 'F-6',
    likeIcons: Icons.thumb_up, // Add the like icon here
    heartIcon: Icons.favorite,
    likeCount: 0,
    heartCount: 0,
    color: const [Color(0xFF2F80ED), Color(0xFF56CCF2)],
    imageUrl: 'images/Gloria jeans.png',
    backgroundImage: 'images/jeans.jpg',
    price: 4,
    dealNames: [
      'Big Mac Combo Deal',
      'Chicken Sandwich Special',
      'Vegetarian Delight',
      'Dessert Paradise',
    ],
    dealImage: [
      'https://i.ibb.co/WsB2tDb/Screenshot-2023-08-21-at-11-30-10-PM.png',
      'https://i.ibb.co/WsB2tDb/Screenshot-2023-08-21-at-11-30-10-PM.png',
      'https://i.ibb.co/WsB2tDb/Screenshot-2023-08-21-at-11-30-10-PM.png',
      'https://i.ibb.co/WsB2tDb/Screenshot-2023-08-21-at-11-30-10-PM.png',
    ],
    dealDescription: [
      'double layer of sear-sizzled 100% pure beef ',
      'sauce and melted cheese, diced onion, crisp shredded',
      'sauce and melted cheese, diced onion, crisp shredded',
      'double layer of sear-sizzled 100% pure beef ',
    ],
  ),
];
