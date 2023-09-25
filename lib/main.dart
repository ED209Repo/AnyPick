import 'package:anypickdemo/MenuPage.dart';
import 'package:anypickdemo/SplashScreen.dart';
import 'package:flutter/material.dart';

import 'New_Payment_Page.dart';
import 'onBoardingScreen.dart';
void main() {
  runApp(
     MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PaymentMethodPage(paymentMethods: [],),
    ),
  );
}
