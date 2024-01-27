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
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: ButtonsTabBar(
                        unselectedBorderColor: Color(0xffd8deda),
                        borderColor: AppColors.themeColor,
                        borderWidth: 2,
                        buttonMargin: EdgeInsets.all(5),
                        contentPadding: EdgeInsets.all(10),
                        backgroundColor: Colors.white,
                        unselectedBackgroundColor: Colors.white,
                        unselectedLabelStyle:  TextStyle(color: Colors.grey[400]),
                        labelStyle:
                         TextStyle(color: AppColors.themeColor, fontWeight: FontWeight.bold),
                        labelSpacing: 10,
                        tabs: const [
                          Tab(
                            text: " Explore ",
                          ),
                          Tab(
                            text: " Top Picks ",
                          ),

                        ],
                      ),
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

