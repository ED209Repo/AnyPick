import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
class scrollList {
  final String title;
  final List<MenuItem> items; // List of items for the category

  scrollList({
    required this.title,
    required this.items,
  });
}

class MenuItem {
  final String title;
  final String imageUrl;
  final String dishType;
  final String description;
  final List<String> options;
  final List<String> flavors;
  final List<String> AdsOn;
  int price;
  int quantity;

  MenuItem({
    required this.title,
    required this.imageUrl,
    required this.dishType,
    required this.description,
    required this.price,
    required this.options,
    required this.flavors,
    required this.AdsOn,
    this.quantity = 0,
  });
}

class scrollListModel {
  static List<scrollList> items = [
    scrollList(
      title: 'Summer Box',
      items: [
        MenuItem(
          title: 'Cookie Sandwich',
          imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRldj56-OSaTw-EYr1aJBAkKXeF2s_XXbVbUA&usqp=CAU',
          dishType: 'Dessert', // Replace with actual dish type
          description: 'A bakery is an establishment that produces and sells flour-based food.',
          price: 110,
          options: ['Chocolate Chip', 'Cookies and Cream', 'Funfetti' ,'M and M' , 'Red Velvet' , 'Peanut Butter' , 'Snickerdoodle'],
          flavors: ['Vanilla', 'Chocolate', 'Strawberry'],
          AdsOn: ['Extra Ketchup','Mayo','Extra Topping'],

        ),
        MenuItem(
          title: 'Combo Burger',
          imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRldj56-OSaTw-EYr1aJBAkKXeF2s_XXbVbUA&usqp=CAU',
          dishType: 'Dessert', // Replace with actual dish type
          description: 'A bakery is an establishment that produces and sells flour-based food.',
          price: 12,
          options: ['Option 1', 'Option 2', 'Option 3'],
          flavors: ['Vanilla', 'Chocolate', 'Strawberry'],
          AdsOn: ['Extra Ketchup','Mayo','Extra Topping'],
        ),
        // Add more items for Deals category
      ],
    ),
    scrollList(
      title: 'Speciality Coffee',
      items: [
        MenuItem(
          title: 'Combo Sandwich',
          imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRldj56-OSaTw-EYr1aJBAkKXeF2s_XXbVbUA&usqp=CAU',
          dishType: 'Dessert', // Replace with actual dish type
          description: 'A bakery is an establishment that produces and sells flour-based food.',
          price: 51,
          options: ['Option 33333', 'Option 2', 'Option 3'],
          flavors: ['Vanilla', 'Chocolate', 'Strawberry'],
          AdsOn: ['Extra Ketchup','Mayo','Extra Topping'],
        ),
        MenuItem(
          title: 'Oyster Dish',
          imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJeWVOiCuEGP_lX_3RLXbOfr8FDT8EIORkYQ&usqp=CAU',
          dishType: 'Dessert', // Replace with actual dish type
          description: 'A bakery is an establishment that produces and sells flour-based food.',
          price: 511,
          options: ['Option 1', 'Option 2', 'Option 3'],
          flavors: ['Vanilla', 'Chocolate', 'Strawberry'],
          AdsOn: ['Extra Ketchup','Mayo','Extra Topping'],
        ),
        // Add more items for Deals category
      ],
    ),
    scrollList(
      title: 'Cold Beverages',
      items: [
        MenuItem(
          title: 'Combo Sandwich',
          imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRldj56-OSaTw-EYr1aJBAkKXeF2s_XXbVbUA&usqp=CAU',
          dishType: 'Dessert', // Replace with actual dish type
          description: 'A bakery is an establishment that produces and sells flour-based food.',
          price: 5,
          options: ['Option 33333', 'Option 2', 'Option 3'],
          flavors: ['Vanilla', 'Chocolate', 'Strawberry'],
          AdsOn: ['Extra Ketchup','Mayo','Extra Topping'],
        ),
        MenuItem(
          title: 'Oyster Dish',
          imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJeWVOiCuEGP_lX_3RLXbOfr8FDT8EIORkYQ&usqp=CAU',
          dishType: 'Dessert', // Replace with actual dish type
          description: 'A bakery is an establishment that produces and sells flour-based food.',
          price: 5,
          options: ['Option 1', 'Option 2', 'Option 3'],
          flavors: ['Vanilla', 'Chocolate', 'Strawberry'],
          AdsOn: ['Extra Ketchup','Mayo','Extra Topping'],
        ),
        // Add more items for Deals category
      ],
    ),
    scrollList(
      title: 'Desserts',
      items: [
        MenuItem(
          title: 'Combo Sandwich',
          imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRldj56-OSaTw-EYr1aJBAkKXeF2s_XXbVbUA&usqp=CAU',
          dishType: 'Dessert', // Replace with actual dish type
          description: 'A bakery is an establishment that produces and sells flour-based food.',
          price: 5,
          options: ['Option 33333', 'Option 2', 'Option 3'],
          flavors: ['Vanilla', 'Chocolate', 'Strawberry'],
          AdsOn: ['Extra Ketchup','Mayo','Extra Topping'],
        ),
        MenuItem(
          title: 'Oyster Dish',
          imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJeWVOiCuEGP_lX_3RLXbOfr8FDT8EIORkYQ&usqp=CAU',
          dishType: 'Dessert', // Replace with actual dish type
          description: 'A bakery is an establishment that produces and sells flour-based food.',
          price: 5,
          options: ['Option 1', 'Option 2', 'Option 3'],
          flavors: ['Vanilla', 'Chocolate', 'Strawberry'],
          AdsOn: ['Extra Ketchup','Mayo','Extra Topping'],
        ),
        // Add more items for Deals category
      ],
    ),
    scrollList(
      title: 'Summer Box',
      items: [
        MenuItem(
          title: 'Cookie Sandwich',
          imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRldj56-OSaTw-EYr1aJBAkKXeF2s_XXbVbUA&usqp=CAU',
          dishType: 'Dessert', // Replace with actual dish type
          description: 'A bakery is an establishment that produces and sells flour-based food.',
          price: 5,
          options: ['Chocolate Chip', 'Cookies and Cream', 'Funfetti' ,'M and M' , 'Red Velvet' , 'Peanut Butter' , 'Snickerdoodle'],
          flavors: ['Vanilla', 'Chocolate', 'Strawberry'],
          AdsOn: ['Extra Ketchup','Mayo','Extra Topping'],

        ),
        MenuItem(
          title: 'Combo Burger',
          imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRldj56-OSaTw-EYr1aJBAkKXeF2s_XXbVbUA&usqp=CAU',
          dishType: 'Dessert', // Replace with actual dish type
          description: 'A bakery is an establishment that produces and sells flour-based food.',
          price: 5,
          options: ['Option 1', 'Option 2', 'Option 3'],
          flavors: ['Vanilla', 'Chocolate', 'Strawberry'],
          AdsOn: ['Extra Ketchup','Mayo','Extra Topping'],
        ),
        // Add more items for Deals category
      ],
    ),
  ];
}
class menuData {
  final String imageUrl;
  menuData({required this.imageUrl});
}
class ImageList {
  static List<menuData> images = [
    menuData(imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOCI8xI5nHfifMlfOIKunvKXEuR7aJQDyOZQ&usqp=CAU'),
    // Add more image URLs as needed
  ];
}
class ScrollListModel {
  final List<ScrollCategoryModel> items;

  ScrollListModel({required this.items});
}

class ScrollCategoryModel {
  final String title;
  final List<ScrollItemModel> items;

  ScrollCategoryModel({required this.title, required this.items});
}

class ScrollItemModel {
  final String title;
  final String description;
  final String imageUrl;
  final double price;

  ScrollItemModel({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.price,
  });
}