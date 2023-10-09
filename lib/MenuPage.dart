import 'package:anypickdemo/APfontsStyle.dart';
import 'package:anypickdemo/MenuPageModel.dart';
import 'package:anypickdemo/New_Menu_Page.dart';
import 'package:anypickdemo/Widgets/AppColors.dart';
import 'package:flutter/material.dart';
import 'ProductPage.dart';
import 'ProductPageModel.dart';
import 'homeScreen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  int currentPageIndex = 0;
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
    final containerHeight = MediaQuery.of(context).size.height * 0.3;
    final double fontSize = MediaQuery.of(context).size.width < 600 ? 14 : 18;
    List<String> tabLabels = [
      "Starter",
      "Main Course",
      "Appetizers",
      "Seafood",
      "Chicken & Lamb",
      "Fast Food",
      "Deserts",
      "Chinese Food",
      "Add ons",
      "Cold Drinks",
    ];

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: containerHeight,
                  child: Stack(
                    children: [
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
                        top: 50,
                        left: 10,
                        child: GestureDetector(
                          onTap: navigateToExamplePage,
                          child: Container(
                            width: 30,
                            height: 30,
                            color: Colors.grey.withOpacity(0.5),
                            // Semi-transparent overlay
                            child: const Icon(
                              Icons.arrow_back_ios_new,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                 Padding(
                  padding: EdgeInsets.fromLTRB(14, 0, 0, 0),
                  child: Text(
                    'MayField Bakery & \nCafe',
                    style: APfontsStyle.customTextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                const SizedBox(height: 8),
                 Padding(
                  padding: EdgeInsets.fromLTRB(14, 0, 0, 0),
                  child: Text(
                    'Chinese  -   American  -  Desi Food',
                    style: APfontsStyle.customTextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: incrementLikeCount,
                        child: Row(
                          children: [
                            const Icon(
                              Icons.thumb_up,
                              color: Colors.blue,
                              size: 30,
                            ),
                            const SizedBox(width: 4),
                            Text('$likeCount'),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      GestureDetector(
                        onTap: incrementHeartCount,
                        child: Row(
                          children: [
                            const Icon(
                              Icons.favorite,
                              color: Colors.red,
                              size: 30,
                            ),
                            const SizedBox(width: 4),
                            Text('$heartCount'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
            
                const SizedBox(height: 20),
              
                const SizedBox(width: 20),
                SingleChildScrollView(
                  child: SizedBox(
                      width: double.infinity,
                      height: 420,
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: scrollListModel.items.length,
                        itemBuilder: (BuildContext context, int index) {
                          final item = scrollListModel.items[index];
                          return Container(
                            margin: const EdgeInsets.all(8.0),
                            padding: const EdgeInsets.all(12.0),
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                image: AssetImage('images/gradient-3.jpg'),
                                // Replace with your background image path
                                fit: BoxFit.cover,
                              ),
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Row(
                              children: [
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
                                const SizedBox(width: 16.0),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => DetailPage(food2: Food2.generateRecommendFoods2()[0]),
                                            ),
                                          );
                                        },
                                        child: Text(
                                          item.title,
                                          style: APfontsStyle.customTextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        ' ${item.description}',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: APfontsStyle.customTextStyle(
                                          
                                          color: Colors.white60,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Container(
                                        width: double.maxFinite,
                                        height: 40,
                                        child: Stack(
                                          children: [
                                            Align(
                                              alignment:
                                                  const Alignment(-0.5, 0),
                                              child: Container(
                                                height: 40,
                                                width: 120,
                                                decoration: BoxDecoration(
                                                  color:
                                                      AppColors.QuantityBGColor.withOpacity(0.1),
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                ),
                                                child: Row(
                                                  children: [
                                                    const SizedBox(
                                                      width: 15,
                                                    ),
                                                    Text(
                                                      ' SAR ${item.price}',
                                                      style: APfontsStyle.customTextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.bottomRight,
                                              child: Container(
                                                height: 40,
                                                width: 90,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  // Use an appropriate color
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        // Handle decrement quantity for this item
                                                        setState(() {
                                                          if (item.quantity >
                                                              0) {
                                                            item.quantity--;
                                                          }
                                                        });
                                                      },
                                                      child:  Text(
                                                        '-',
                                                        style: APfontsStyle.customTextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                    Text(
                                                      item.quantity.toString(),
                                                      // Access the quantity property of the item
                                                      style: APfontsStyle.customTextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        // Handle increment quantity for this item
                                                        setState(() {
                                                          item.quantity++;
                                                        });
                                                      },
                                                      child:  Text(
                                                        '+',
                                                        style: APfontsStyle.customTextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
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
                          );
                        },
                      )),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: <Widget>[
                        for (int index = 0; index < tabLabels.length; index++)
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                currentPageIndex = index;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 16),
                              color: currentPageIndex == index
                                  ? AppColors.SplashColor// You can set the active tab's color here
                                  : AppColors.themeColor,
                              // You can set the inactive tab's color here
                              child: Text(
                                tabLabels[index],
                                style: APfontsStyle.customTextStyle(
                                  color: Colors.white, // Text color
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

 TextStyle commonTextStyle = APfontsStyle.customTextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
  color: Colors.black,
);
