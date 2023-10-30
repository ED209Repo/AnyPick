import 'package:anypickdemo/AccountSettings.dart';
import 'package:anypickdemo/OrderScreenTabBar.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'HomeScreenTabBar.dart';
import 'Widgets/AppColors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  bool _showMoreContent = false;

  // Define your content screens here.
  final List<Widget> _screens = [
    // Screen for 'Order' tab
    Container(
      color: AppColors.themeColor,
      alignment: Alignment.center,
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 130,
            backgroundColor: AppColors.themeColor,
            elevation: 0,
            flexibleSpace: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          child: Image.asset("images/whiteicon2.png"),
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 45,
                        width: 320,
                        child: TextField(
                          textAlign: TextAlign.start,
                          decoration: InputDecoration(
                            label: const Text("Search Food"),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            prefixIcon: const Icon(Icons.search, color: Colors.grey),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.blackColor,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.themeColor2,
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
          ),
          body: Container(
            child: SlidingSegmentedControlDemo(),
          ),
        ),
      ),
    ),
    // Screen for 'Employee' tab
    Container(
      color: AppColors.themeColor2,
      alignment: Alignment.center,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text("Order",
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.bold
          ),),
          centerTitle: true,
        ),
        body: OrderScreenTabbar(),
      )
    ),
  ];

  @override
  Widget build(BuildContext context) {
    if (_showMoreContent) {
      // Display the "More" content as a simple page.
      return Scaffold(
        body: Container(
          child: const AccountSettingsPage(),
        )
      );
    } else {
      // Display the FlashyTabBar.
      return Scaffold(
        body: _screens[_selectedIndex],
        bottomNavigationBar: FlashyTabBar(
          height: 55,
          animationDuration: const Duration(milliseconds: 500),
          selectedIndex: _selectedIndex,
          showElevation: true,
          onItemSelected: (index) => setState(() {
            _selectedIndex = index;
            if (index == 2) {
              // If "More" tab is selected, show the "More" content as a simple page.
              _showMoreContent = true;
            } else {
              _showMoreContent = false;
            }
          }),
          items: [
            FlashyTabBarItem(
              icon: Icon(
                Icons.home,
                color: _selectedIndex == 0 ? AppColors.themeColor : AppColors.themeColor2,
              ),
              title: Text('Home', style: TextStyle(color: _selectedIndex == 0 ? AppColors.themeColor : AppColors.themeColor2)),
            ),
            FlashyTabBarItem(
              icon: Icon(
                Icons.access_time,
                color: _selectedIndex == 1 ? AppColors.themeColor : AppColors.themeColor2,
              ),
              title: Text('Order', style: TextStyle(color: _selectedIndex == 1 ? AppColors.themeColor : AppColors.themeColor2)),
            ),
            FlashyTabBarItem(
              icon: Icon(
                Icons.more_horiz,
                color: _selectedIndex == 2 ? AppColors.themeColor : AppColors.themeColor2,
              ),
              title: Text('More', style: TextStyle(color: _selectedIndex == 2 ? AppColors.themeColor : AppColors.themeColor2)),
            ),
          ],
        ),
      );
    }
  }
}
