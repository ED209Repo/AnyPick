import 'package:anypickdemo/Cart_screen.dart';
import 'package:anypickdemo/MenuPage.dart';
import 'package:anypickdemo/SplashScreen.dart';
import 'package:anypickdemo/homeScreen.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(
     const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CartScreen(),
    ),
  );
}
