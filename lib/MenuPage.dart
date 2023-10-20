import 'package:anypickdemo/APfontsStyle.dart';
import 'package:anypickdemo/MenuPageModel.dart';
import 'package:anypickdemo/New_Menu_Page.dart';
import 'package:anypickdemo/Widgets/AppColors.dart';
import 'package:flutter/material.dart';
import 'homeScreen.dart';
import 'menuSelectionModel.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  int selectedIndex = 0;
  int likeCount = 0;
  int heartCount = 0;

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
            const Example(), // Replace with your Example widget
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final menuItems = [
      'Summer Box',
      'Speciality Coffee',
      'Cold Beverages',
      'Desserts',
      'Summer Box',
      'Summer Box',
    ];
    final containerHeight = MediaQuery.of(context).size.height * 0.3;
    return Scaffold(
        body: Column(
      children: <Widget>[
        SizedBox(
          height: containerHeight,
          child: Stack(
            children: [
              // PageView for displaying images
              PageView.builder(
                itemCount: ImageList.images.length,
                itemBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: double.infinity,
                    child: Image.network(
                      ImageList.images[index].imageUrl,
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
              Positioned(
                top: 35,
                left: 20,
                child: GestureDetector(
                  onTap: () {
                    // Navigate back to the MenuPage when the close button is pressed
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
                        Icons.cancel,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 5,
                left: 10,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0), // Add border radius for rounded corners
                  ),
                  width: MediaQuery.of(context).size.width - 20,
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0), // Add border radius for the inner container
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 10, 0, 5),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.coffee,
                                color: Colors.black,
                                size: 24,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                "Business Coffee",
                                style: APfontsStyle.customTextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 0, 0, 7),
                          child: Text(
                            "Desserts - Beverages - Coffee",
                            style: APfontsStyle.customTextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 0, 10, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align items to the start and end
                            children: [
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      incrementLikeCount();
                                    },
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.thumb_up,
                                          color: Colors.grey,
                                          size: 25,
                                        ),
                                        const SizedBox(width: 3),
                                        Text(
                                          likeCount.toString(),
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 19,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  GestureDetector(
                                    onTap: () {
                                      incrementHeartCount();
                                    },
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.favorite,
                                          color: Colors.grey,
                                          size: 25,
                                        ),
                                        const SizedBox(width: 3),
                                        Text(
                                          heartCount.toString(),
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 19,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 5, 5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Icon(
                                      Icons.directions_car,
                                      color: Colors.grey,
                                      size: 24,
                                    ),
                                    Text(
                                      "5 Km",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
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
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 9),
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: isSelected ? AppColors.themeColor : Colors.transparent,
                        borderRadius: BorderRadius.circular(20), // Adjust the radius as needed
                      ),
                      child: Text(
                        menuItems[index],
                        style: TextStyle(
                          fontSize: 20,
                          color: isSelected ? Colors.white : Colors.black,
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
          child: SingleChildScrollView(
            child: ListView.builder(
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
                      shrinkWrap: true,
                      primary: false,
                      itemCount: category.items.length,
                      itemBuilder: (context, itemIndex) {
                        final item = category.items[itemIndex];
                        return Container(
                          margin: const EdgeInsets.all(8.0),
                          padding: const EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                            // image: const DecorationImage(
                            //   image: AssetImage('images/gradient-3.jpg'),
                            //   fit: BoxFit.cover,
                            // ),
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
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
                                    color: AppColors.themeColor, // Background color of the oval
                                  ),
                                  child: const Icon(
                                    Icons.add, // You can change this to your increment icon
                                    color: Colors.white,
                                  ),
                                ),
                              ),

                            ],
                          ),
                        );
                      },
                    )

                  ],
                );
              },
            ),
          ),
        )
      ],
    ));
  }
}
