import 'package:anypickdemo/Widgets/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

import 'Register.dart';
import 'Widgets/CustomButton.dart';
import 'homeScreen.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({Key? key}) : super(key: key);

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
            padding: const EdgeInsets.only(bottom: 5),
            child: Image.asset(
              'images/mainlogo.png',
              height: 150,
              width: 150,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Image.asset(
              'images/onboarding1.png',
              height: 250,
              width: 250,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 90),
            child: Text(
              "Find your desired food around you",
              style: TextStyle(
                color: AppColors.greyText,
                fontSize: 14,
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
            padding: const EdgeInsets.only(bottom: 5,),
            child: Image.asset(
              'images/whiteicon.png',
              height: 150,
              width: 150,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Image.asset(
              'images/onboarding2.png',
              height: 250,
              width: 250,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 90),
            child: Text(
              "Pickup your food on the go",
              style: TextStyle(
                color: AppColors.whitetext,
                fontSize: 14,
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
            padding: const EdgeInsets.only(bottom: 10),
            child: Image.asset(
              "images/mainlogo.png",
              height: 150,
              width: 150,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Image.asset(
              "images/image1.png",
              height: 150,
              width: 150,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 40 , left: 10 , right: 10),
            child: Text(
              "We are excited, let's get started!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 14,
                color: AppColors.blackColor,
              ),
            ),
          ),
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
                bottom: 180,
                left: 30,
                right: 30,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    (currentPage == 2 )
                        ? CustomButton(
                      text: "Continue",
                      onPressed: () => HomeMethod(context),
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

                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Positioned(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 80),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    // children: [
                    //   if (currentPage == 2)
                    //     TextButton(
                    //     //   onPressed: () => HomeMethod(context),
                    //     //   child: Text("Skip",
                    //     //     style: TextStyle(
                    //     //         color: AppColors.themeColor,
                    //     //         fontSize: 17,
                    //     //         fontWeight: FontWeight.w400
                    //     //     ),),
                    //     // ),
                    // ],
                  ),
                ),
              )
            ]));
  }

  void continueMethod(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const registerscreen()),
          (Route<dynamic> route) => false,
    );
  }
  void HomeMethod(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const Example()),
          (Route<dynamic> route) => false,
    );
  }
}

