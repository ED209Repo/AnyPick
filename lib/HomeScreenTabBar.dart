import 'package:anypickdemo/Nearby.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'BrowseScreen.dart';
import 'Widgets/AppColors.dart';


class SlidingSegmentedControlDemo extends StatefulWidget {
  @override
  _SlidingSegmentedControlDemoState createState() =>
      _SlidingSegmentedControlDemoState();
}

class _SlidingSegmentedControlDemoState
    extends State<SlidingSegmentedControlDemo> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
          length: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: ButtonsTabBar(
                      backgroundColor: AppColors.themeColor,
                      unselectedBackgroundColor: Colors.grey[300],
                      unselectedLabelStyle: const TextStyle(color: Colors.black),
                      labelStyle:
                      const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      labelSpacing: 10,
                      tabs: const [
                        Tab(
                          text: "Explore",
                        ),
                        Tab(
                          text: "Nearby",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
               const Expanded(
                child: TabBarView(
                  children: <Widget>[
                    Center(
                      child: TryScreen(),
                    ),
                    Center(
                      child: NearByScreen(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
  }
}

