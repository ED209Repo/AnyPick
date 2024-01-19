import 'package:anypickdemo/AccountSettings.dart';
import 'package:anypickdemo/Cart_screen.dart';
import 'package:anypickdemo/OrderScreenTabBar.dart';
import 'package:anypickdemo/Register.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
    DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(110.0),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: AppColors.themeColor,
            elevation: 0,
            title: Text("AnyPick",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),) ,
            actions: [
              IconButton(onPressed: (){}, icon: Icon(Icons.location_on,color: Colors.white,),),
            ],
            flexibleSpace: Padding(
              padding: const EdgeInsets.only(left: 8.0,right: 8.0, bottom: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: kToolbarHeight),
                  TextField(
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      labelText: "Search Food",
                      contentPadding: EdgeInsets.all(10.0),
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
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(10)
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
                ],
              ),
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
    // Screen for 'Employee' tab
    Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.themeColor,
        elevation: 0,
        title: const Text(
          "Orders",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: OrderScreenTabbar(),
    ),
    Scaffold(
      body: CartScreen(),
    ),
    Scaffold(
      body: AccountSettingsPage(),
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
        onItemSelected: (index) => setState(() async { if (index == 3) { // If "Settings" tab is selected
    final preferences = await SharedPreferences.getInstance();
    final String? phoneNumber = preferences.getString('phoneNumber');

    if (phoneNumber != null) {
    // Navigate to the "Account Settings" screen
    Navigator.push(context, MaterialPageRoute(builder: (context) => AccountSettingsPage()));
    } else {
      // Open a bottom sheet to prompt the user to register
      showModalBottomSheet<dynamic>(
        backgroundColor: Colors.white,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
        ),
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.9,
            width: double.infinity,
            child: registerscreen(), // Assuming 'registerscreen' is a valid widget
          );
        },
      );
    }
    } else {
    // For other tabs, simply set the selected index
    setState(() {
    _selectedIndex = index;
    });
    }
    },),
        items: [
          FlashyTabBarItem(
            icon: Icon(
              Icons.home,
              size: 28,
              color: _selectedIndex == 0 ? AppColors.themeColor : Colors.grey[400],
            ),
            title: Text(
              'Home',
              style: TextStyle(
                color: _selectedIndex == 0 ? AppColors.themeColor : Colors.grey[400],
                fontSize: 18,
              ),
            ),
          ),
          FlashyTabBarItem(
            icon: Icon(
              Icons.access_time_outlined,
              size: 28,
              color: _selectedIndex == 1 ? AppColors.themeColor : Colors.grey[400],
            ),
            title: Text(
              'Order',
              style: TextStyle(
                color: _selectedIndex == 1 ? AppColors.themeColor : Colors.grey[400],
                fontSize: 18,
              ),
            ),
          ),
          FlashyTabBarItem(
            icon: Icon(
              Icons.shopping_cart_outlined,
              size: 28,
              color: _selectedIndex == 2 ? AppColors.themeColor : Colors.grey[400],
            ),
            title: Text(
              'Cart',
              style: TextStyle(
                color: _selectedIndex == 2 ? AppColors.themeColor : Colors.grey[400],
                fontSize: 18,
              ),
            ),
          ),
          FlashyTabBarItem(
            icon: Icon(
              Icons.more_horiz_outlined,
              size: 28,
              color: _selectedIndex == 3 ? AppColors.themeColor : Colors.grey[400],
            ),
            title: Text(
              'More',
              style: TextStyle(
                color: _selectedIndex == 3 ? AppColors.themeColor : Colors.grey[400],
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
