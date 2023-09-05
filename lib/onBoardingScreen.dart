import 'package:anypickdemo/Widgets/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

import 'Register.dart';
import 'Widgets/CustomButton.dart';
import 'homeScreen.dart';

class OnboardScreen extends StatefulWidget {
  OnboardScreen({Key? key}) : super(key: key);

  @override
  _OnboardscreenState createState() => _OnboardscreenState();
}

class _OnboardscreenState extends State<OnboardScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final pages = [
    Container(
      width: double.infinity,
      color: AppColors.whitetext,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Image.asset(
              'images/mainlogo.png',
              height: 150,
              width: 150,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Image.asset(
              'images/onboarding1.png',
              height: 300,
              width: 300,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: Text(
              "Find Your Desired Food Around You",
              style: TextStyle(
                color: AppColors.greyText,
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    ),
    Container(
      width: double.infinity,
      height: double.infinity,
      color: AppColors.themeColor2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 10,),
            child: Image.asset(
              'images/whiteicon.png',
              height: 150,
              width: 150,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Image.asset(
              'images/onboarding2.png',
              height: 300,
              width: 300,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5, bottom: 10),
            child: Text(
              "Pickup Your Food On The Go",
              style: TextStyle(
                color: AppColors.whitetext,
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    ),
    Container(
      width: double.infinity,
      color: AppColors.whitetext,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Image.asset(
              "images/mainlogo.png",
              height: 150,
              width: 150,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 30),
            child: Image.asset(
              "images/image1.png",
              height: 180,
              width: 180,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              "Welcome",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: AppColors.blackColor,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10 , left: 10 , right: 10),
            child: Text(
              "It's a pleasure to meet you. We are excited that you're here so let's get started!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 20,
                color: AppColors.blackColor,
              ),
            ),
          ),
          // Padding(
          //   padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
          //   child: SizedBox(
          //     width: double.infinity,
          //     height: 40,
          //   ),
          // )
        ],
      ),
    ),
  ];

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
            children: [
              // TextButton(
              //     onPressed:()=> continueMethod(context),
              //     child: Text("Skip",
              //       style: TextStyle(
              //         color: AppColors.themeColor,
              //       ),)),
              LiquidSwipe(
                pages: pages,
                enableLoop: false,
                waveType: WaveType.liquidReveal,
                onPageChangeCallback: (page) {
                  setState(() {
                    currentPage = page;
                  });
                },
              ),
              Positioned(
                bottom: 50,
                left: 10,
                right: 10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    (currentPage == 2 )
                        ? CustomButton(
                      text: "SignUp",
                      onPressed: () => continueMethod(context),
                    )
                        : Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            ...List<Widget>.generate(pages.length, (index) {
                              return AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                height: 10,
                                width: index == currentPage ? 15 : 10,
                                margin: const EdgeInsets.symmetric(horizontal: 5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: index == currentPage
                                      ? AppColors.themeColor
                                      : AppColors.greyText,
                                ),
                              );
                            }),
                          ],
                        ),
                         // Add spacing between buttons and indicators
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Positioned(
                // bottom: 10,
                // left: 10,
                // right: 10,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      if (currentPage == 2)
                        TextButton(
                          onPressed: () => HomeMethod(context),
                          child: Text("Skip",
                            style: TextStyle(
                                color: AppColors.themeColor,
                                fontSize: 17,
                                fontWeight: FontWeight.w400
                            ),),
                        ),
                    ],
                  ),
                ),
              )
            ]));
  }

  void continueMethod(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => registerscreen()),
          (Route<dynamic> route) => false,
    );
  }
  void HomeMethod(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => Example()),
          (Route<dynamic> route) => false,
    );
  }
}

