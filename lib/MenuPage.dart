import 'package:anypickdemo/NewHomeScreen.dart';
import 'package:anypickdemo/Widgets/AppColors.dart';
import 'package:flutter/material.dart';
import 'APfontsStyle.dart';
import 'New_Menu_Page.dart';
import 'MenuPageModel.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {

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
                          builder: (context) => const MenuPage(),
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
                  bottom: 0,
                  left: 10,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0), // Add border radius for rounded corners
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0), // Add border radius for the inner container
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                            child: Column(
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  color: Colors.black,
                                  size: 24,
                                ),
                                Text(
                                  "1.4 Km",
                                  style: APfontsStyle.customTextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const VerticalDivider(
                                color: Colors.black, // Set the color of the vertical divider
                                width: 100,
                                thickness: 3,// Set the width of the vertical divider
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                                child: Column(
                                  children: [
                                    const Icon(
                                      Icons.access_time_filled_sharp,
                                      color: Colors.black,
                                      size: 24,
                                    ),
                                    Text(
                                      "Closes at 12:45 AM",
                                      style: APfontsStyle.customTextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      )


                    ),
                  ),
                ),
                Positioned(
                  left: 20,
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
                          Text(
                            "American",
                            style: APfontsStyle.customTextStyle(
                              color: Colors.black,
                              fontSize: 17,
                            ),
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.delivery_dining_rounded,
                                color: Colors.black,
                                size: 24,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                "1 Riyal",
                                style: APfontsStyle.customTextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
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
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(menuItems.length, (index) {
                  final isSelected = index == selectedIndex;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                        scrollToItem(index);
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
                            menuItems[index],
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
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              shrinkWrap: true,
              primary: false,
              itemCount: scrollListModel.items.length,
              itemBuilder: (context, index) {
                final category = scrollListModel.items[index];
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          category.title,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    ListView.builder(
                      controller: innerListController,
                      shrinkWrap: true,
                      primary: false,
                      itemCount: category.items.length,
                      itemBuilder: (context, itemIndex) {
                        final item = category.items[itemIndex];
                        return Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.all(8.0),
                              padding: const EdgeInsets.all(12.0),
                              child: Stack(
                                children: [
                                  Row(
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
                                                item.title,
                                                style: APfontsStyle.customTextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 22.0,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              ' ${item.description}',
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: APfontsStyle.customTextStyle(
                                                color: Colors.black,
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                              ' ${item.price} SR',
                                              style: APfontsStyle.customTextStyle(
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 120.0,
                                        height: 120.0,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(12.0),
                                          child: Image.network(
                                            item.imageUrl,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Positioned(
                                    bottom: 0,
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
            ),
          ),
        ],
      ),
    );
  }
}




