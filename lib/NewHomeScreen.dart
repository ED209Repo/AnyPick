import 'package:anypickdemo/AccountSettings.dart';
import 'package:anypickdemo/Cart_screen.dart';
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

  // Define your content screens here.
  final List<Widget> _screens = [
    // Screen for 'Order' tab
    Container(
      color: AppColors.themeColor,
      alignment: Alignment.center,
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: PreferredSize(
  preferredSize: Size.fromHeight(110.0),
  child: AppBar(
    backgroundColor: AppColors.themeColor,
    elevation: 0,
    flexibleSpace: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "AnyPick",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              Spacer(),
              Spacer(),
              Expanded(
                child: Icon(Icons.location_on, size: 30, color: Colors.white),
              )
            ],
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 45,
                width: 375,
                child: TextField(
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    labelText: "Search Food",
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    prefixIcon: const Icon(Icons.search, color: Colors.grey),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.whitetext,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.red,
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    ),
  ),
),
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              child: SlidingSegmentedControlDemo(),
            ),
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
          backgroundColor: AppColors.themeColor,
          elevation: 0,
          title: const Text("Orders",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold
          ),),
          centerTitle: true,
        ),
        body: OrderScreenTabbar(),
      )
    ),
    Container(
      child: const Scaffold(
        body: CartScreen(),
      ),
    ),
    Container(
      child: const Scaffold(
        body: AccountSettingsPage(),
      ),
    )
  ];

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: _screens[_selectedIndex],
        bottomNavigationBar: FlashyTabBar(
          height: 55,
          animationDuration: const Duration(milliseconds: 500),
          selectedIndex: _selectedIndex,
          showElevation: true,
          onItemSelected: (index) => setState(() {
            _selectedIndex = index;
          }),
          items: [
            FlashyTabBarItem(
              icon: Icon(
                Icons.home,
                size: 28,
                color: _selectedIndex == 0 ? AppColors.themeColor : Colors.grey[400],
              ),
              title: Text('Home', style: TextStyle(color: _selectedIndex == 0 ? AppColors.themeColor : Colors.grey[400],fontSize: 18)),
            ),
            FlashyTabBarItem(
              icon: Icon(
                Icons.access_time_outlined,
                size: 28,
                color: _selectedIndex == 1 ? AppColors.themeColor : Colors.grey[400],
              ),
              title: Text('Order', style: TextStyle(color: _selectedIndex == 1 ? AppColors.themeColor :Colors.grey[400],fontSize: 18)),
            ),
            FlashyTabBarItem(
              icon: Icon(
                Icons.shopping_cart_outlined,
                size: 28,
                color: _selectedIndex == 2 ? AppColors.themeColor : Colors.grey[400],
              ),
              title: Text('Cart', style: TextStyle(color: _selectedIndex == 2 ? AppColors.themeColor : Colors.grey[400],fontSize: 18)),
            ),
            FlashyTabBarItem(
              icon: Icon(
                Icons.settings,
                size: 28,
                color: _selectedIndex == 3 ? AppColors.themeColor : Colors.grey[400],
              ),
              title: Text('Setting', style: TextStyle(color: _selectedIndex == 3 ? AppColors.themeColor : Colors.grey[400],fontSize: 18)),
            ),
          ],
        ),
      );
  }
}
