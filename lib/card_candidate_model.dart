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
  var likeIcons;
  var heartIcon;
  int likeCount;
  int heartCount;

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
    required this.likeIcons,
    required this.heartIcon,
    required this.likeCount,
    required this.heartCount,
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
    imageUrl: 'images/mc logo.png',
    backgroundImage: 'images/mc.jpg',
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
    imageUrl: 'images/Kfc logo.png'
    ,
    backgroundImage: 'images/kfc.jpg',
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
    imageUrl: 'images/hardess logo.png',
    backgroundImage: 'images/hardess.jpg',

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
    imageUrl: 'images/burger lab.png',
    backgroundImage: 'images/lab.jpg',
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
    imageUrl: 'images/Gloria jeans.png'
    // imageUrl: 'https://example.com/Gloria jeans.png',
    // if pictures get at runtime
    ,
    backgroundImage: 'images/jeans.jpg',
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
  ),
];