import 'package:anypickdemo/NewHomeScreen.dart';
import 'package:anypickdemo/Request_Model.dart';
import 'package:anypickdemo/Widgets/AppColors.dart';
import 'package:flutter/material.dart';
import 'APfontsStyle.dart';
import 'New_Menu_Page.dart';
import 'MenuPageModel.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  final RestaurantModel restaurant;

   MenuPage({Key? key, required this.restaurant}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
   Future<List<RestaurantCategoryModel>> _fetchCategories() async {
    // Replace this with your actual API call or data fetching logic
    // For example, you can use http package for making HTTP requests.
    // Make sure to handle errors and loading states accordingly.
    // For simplicity, I'm returning a hardcoded list of categories here.
    return Future.delayed(Duration(seconds: 1), () {
      return widget.restaurant.rest_Cat ?? []; // Assuming rest_Cat is a List<RestaurantCategoryModel>
    });
  }

     Future<List<FoodItemModel>> _fetchfooditems() async {
    // Replace this with your actual API call or data fetching logic
    // For example, you can use http package for making HTTP requests.
    // Make sure to handle errors and loading states accordingly.
    // For simplicity, I'm returning a hardcoded list of categories here.
    return Future.delayed(Duration(seconds: 1), () {
      return widget.restaurant.food_Items?? []; // Assuming rest_Cat is a List<RestaurantCategoryModel>
    });
  }

  int selectedIndex = 0;
  int likeCount = 0;
  int heartCount = 0;
  double itemHeight = 200.0;
  ScrollController scrollController = ScrollController();
  ScrollController innerListController = ScrollController();
  final menuItems = [
    'Summer Box',
    'Speciality Coffee',
    'Cold Beverages',
    'Desserts',
    'Summer Box',
  ];

  void incrementLikeCount() {
    setState(() {
      likeCount++;
    });
  }

  void incrementHeartCount() {
    setState(() {
      heartCount++;
    });
  }
  void navigateToExamplePage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
        const HomeScreen(), // Replace with your Example widget
      ),
    );
  }

  void scrollToItem(int index) {
    double position = 0;
    for (int i = 0; i < index; i++) {
      position += scrollListModel.items[i].items.length * itemHeight-50;
    }

    scrollController.animateTo(
      position,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }


  @override
  Widget build(BuildContext context) {
    final containerHeight = MediaQuery.of(context).size.height * 0.3;
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
            height: containerHeight,
            child: Stack(
              children: [
                PageView.builder(
                  //itemCount: ImageList.images.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      decoration: const BoxDecoration(
                        color: Colors.white, // Replace with your desired background color
                      ),
                      child: const SizedBox(
                        width: double.infinity,
                        // Your content goes here, like Image.network or other widgets
                      ),
                    );
                  },
                ),
                Positioned(
                  top: 60,
                  left: 20,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                  
                    },
                    child: ClipOval(
                      child: Container(
                        width: 30,
                        height: 30,
                        color: Colors.white,
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 25,
                  bottom: 70,
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
                        child: Container(
                          width: 80,
                          height: 80,
                          child: Image.network(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRldj56-OSaTw-EYr1aJBAkKXeF2s_XXbVbUA&usqp=CAU',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      const SizedBox(width: 10), // Add spacing between the image and text
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Section B | القسم ب",
                                style: APfontsStyle.customTextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              ),
                              const SizedBox(width: 10),
                              const Icon(
                                Icons.verified,
                                color: Colors.red,
                                size: 24,
                              ),
                            ],
                          ),
                          Row(
                                  children: [
                                          const Icon(
                                            Icons.location_on,
                                            color: Colors.black,
                                            size: 24,
                                          ),
                                    const SizedBox(width: 10),
                                    Text(
                                      "1.4 Km",
                                      style: APfontsStyle.customTextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ],
                                ),
                          Row(
                           children: [
                            const Icon(
                             Icons.access_time_filled_sharp,
                           color: Colors.black,
                            size: 24,
                           ),
                             const SizedBox(width: 10),
                            Text(
                              "12:45 AM",
                              maxLines: 2,
                              style: APfontsStyle.customTextStyle(
                                color: Colors.black,
                                fontSize: 17,
                              ),
                            ),
                    ],
                  ),
                        ],
                      )

                    ],
                  ),

                ),



              ],
            ),
          ),

          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: FutureBuilder<List<RestaurantCategoryModel>>(
        future: _fetchCategories(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Loading state
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Error state
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            // Data loaded successfully
            List<RestaurantCategoryModel> categories = snapshot.data ?? [];
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(categories.length, (index) {
                  final isSelected = index == selectedIndex;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                        categories[index];
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 9),
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        // decoration: BoxDecoration(
                        //   color: isSelected ? AppColors.themeColor : Colors.white,
                        //   borderRadius: BorderRadius.circular(20),
                        // ),
                        child: Container(
                          decoration: isSelected
                              ? const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Color(0xffF5A896),
                                width: 1.5, // Adjust the underline thickness as needed
                              ),
                            ),
                          )
                              : null,
                          child: Text(
                            categories[index]?.name ?? 'no name',
                            style: TextStyle(
                              fontSize: 20,
                              color: isSelected ? AppColors.themeColor : Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            );}
          })),
          const SizedBox(height: 10),
          Expanded(
            child: FutureBuilder<List<FoodItemModel>>(
        future: _fetchfooditems(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Loading state
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Error state
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            // Data loaded successfully
            List<FoodItemModel> foodItems = snapshot.data ?? [];
            return ListView.builder(
              controller: scrollController,
              shrinkWrap: true,
              primary: false,
              itemCount: foodItems.length,
              itemBuilder: (context, index) {
                final MenuItem = foodItems[index];
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          foodItems[index]?.name ?? 'no name',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: AppColors.themeColor,
                          ),
                        ),
                      ),
                    ),
                    ListView.builder(
                      controller: innerListController,
                      shrinkWrap: true,
                      primary: false,
                      itemCount: foodItems.length,
                      itemBuilder: (context, itemIndex) {
                        final item = foodItems[index];
                        return Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.all(8.0),
                              padding: const EdgeInsets.all(12.0),
                              child: Stack(
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) => DetailPage(
                                                      food2: Food2.generateRecommendFoods2()[0],
                                                    ),
                                                  ),
                                                );
                                              },
                                              child: Text(
                                                item?.name ?? 'no name',
                                                style: APfontsStyle.customTextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 22.0,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              ' ${item.description}',
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: APfontsStyle.customTextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            
                                          ],
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          SizedBox(
                                            width: 100.0,
                                            height: 100.0,
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(12.0),
                                              child: Image.network(
                                                item.imageUrl,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Text(
                                              ' ${item.price} SR',
                                              textAlign: TextAlign.left,
                                              style: APfontsStyle.customTextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600
                                              ),
                                            ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Positioned(
                                    bottom: 20,
                                    right: 0,
                                    child: Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColors.themeColor,
                                      ),
                                      child: const Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Divider(
                              thickness: 1.5, // Adjust the thickness of the divider as needed
                              color: Colors.grey, // Adjust the color of the divider
                              indent: 16, // Decrease the space on the left side of the divider
                              endIndent: 16, // Decrease the space on the right side of the divider
                              height: 0, // You can set this to create spacing between items and the divider
                            ),
                          ],
                        );

                      },
                    )
                  ],
                );
              },
            );
  }})
      )],
      ),
    );
  }
}



