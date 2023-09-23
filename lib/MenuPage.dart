import 'package:anypickdemo/MenuPageModel.dart';
import 'package:anypickdemo/Widgets/AppColors.dart';
import 'package:flutter/material.dart';
import 'New_Menu_Page.dart';
import 'homeScreen.dart';
import 'menuSelection.dart';


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
        builder: (context) => const Example(), // Replace with your Example widget
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final containerHeight = MediaQuery.of(context).size.height * 0.3;
    final double fontSize = MediaQuery.of(context).size.width < 600 ? 14 : 18;

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
                            color: Colors.grey.withOpacity(0.5), // Semi-transparent overlay
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
                const Padding(
                  padding: EdgeInsets.fromLTRB(14, 0, 0, 0),
                  child: Text(
                    'MayField Bakery & \nCafe',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                const SizedBox(height: 8),
                const Padding(
                  padding: EdgeInsets.fromLTRB(14, 0, 0, 0),
                  child: Text(
                    'Chinese  -   American  -  Desi Food',
                    style: TextStyle(
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
                // SizedBox(
                //   height: 140,
                //   child: ListView.builder(
                //     scrollDirection: Axis.horizontal,
                //     itemCount: MenuPageModel.items.length,
                //     itemBuilder: (BuildContext context, int index) {
                //       final menuItem = MenuPageModel.items[index];
                //       return ClipRRect(
                //         borderRadius: BorderRadius.circular(30),
                //         child: Container(
                //           width: 120,
                //           margin: const EdgeInsets.symmetric(horizontal: 10),
                //           color: Colors.grey[300],
                //           child: Column(
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             children: [
                //               Expanded(
                //                 child: Image.network(
                //                   menuItem.imageUrl,
                //                   fit: BoxFit.cover,
                //                   width: double.infinity,
                //                 ),
                //               ),
                //               Padding(
                //                 padding: const EdgeInsets.all(8.0),
                //                 child: Text(
                //                   menuItem.title,
                //                   style: const TextStyle(
                //                     fontWeight: FontWeight.bold,
                //                   ),
                //                 ),
                //               ),
                //               Padding(
                //                 padding: const EdgeInsets.only(
                //                     left: 8.0, bottom: 8.0),
                //                 child: Text(
                //                   menuItem.dishType,
                //                   style: const TextStyle(
                //                     color: Colors.grey,
                //                     fontStyle: FontStyle.italic,
                //                   ),
                //                 ),
                //               ),
                //             ],
                //           ),
                //         ),
                //       );
                //     },
                //   ),
                // ),
                const SizedBox(height: 20),
                // const SingleChildScrollView(
                //   scrollDirection: Axis.horizontal,
                //   child: Row(
                //     mainAxisSize: MainAxisSize.max,
                //     children: [
                //       SizedBox(width: 10),
                //       Text('Starter',style: commonTextStyle),
                //       SizedBox(width: 20),
                //       Text('Main Course',style: commonTextStyle),
                //       SizedBox(width: 20),
                //       Text('Appetizers',style: commonTextStyle),
                //       SizedBox(width: 20),
                //       Text('Seafood',style: commonTextStyle),
                //       SizedBox(width: 20),
                //       Text('Chicken & Lamb',style: commonTextStyle),
                //       SizedBox(width: 20),
                //       Text('Fast Food',style: commonTextStyle),
                //       SizedBox(width: 20),
                //       Text('Deserts',style: commonTextStyle),
                //       SizedBox(width: 20),
                //       Text('Chinese Food',style: commonTextStyle),
                //       SizedBox(width: 20),
                //       Text('Add ons',style: commonTextStyle),
                //       SizedBox(width: 20),
                //       Text('Cold Drinks',style: commonTextStyle),
                //       SizedBox(width: 20),
                //       // Add more Text widgets as needed
                //     ],
                //   ),
                // ),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) => DetailPage(
                                              food: Food.generateRecommendFoods()[0], // Pass the Food object here
                                            ),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        item.title,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22.0,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      ' ${item.description}',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontStyle: FontStyle.italic,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        Text(
                                          ' SAR ${item.price}',
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.green,
                                          ),
                                        ),
                                        const Spacer(),
                                        IconButton(
                                          onPressed: () {
                                            setState(() {
                                              item.count++;
                                            });
                                          },
                                          icon: const Icon(
                                            Icons.add_outlined,
                                            color: Colors.green,
                                            size: 32,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.all(8.0), // Add padding to control the background size
                                              decoration: BoxDecoration(
                                                color: Colors.grey.withOpacity(0.5), // Set the desired opacity
                                                borderRadius: BorderRadius.circular(8.0), // Add border radius if needed
                                              ),
                                              child: Text(
                                                '${item.count}',
                                                style: const TextStyle(
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white, // Text color
                                                ),
                                              ),
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                if (item.count > 0) {
                                                  setState(() {
                                                    item.count--;
                                                  });
                                                }
                                              },
                                              icon: const Icon(
                                                Icons.remove_outlined,
                                                color: Colors.red,
                                                size: 32,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                 BottomNavigationBar(
                  currentIndex: currentPageIndex,
                  onTap: (index) {
                    setState(() {
                      currentPageIndex = index;
                    });
                  },
                  items:  <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Icon(
                          Icons.local_pizza_outlined,
                        size: 30,
                          color: AppColors.themeColor2,
                      ),
                      label: 'Pizza',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.fastfood_outlined,
                      size: 30,
                      color: AppColors.themeColor2),
                      label: 'Burgers',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.food_bank,
                      size: 30,
                          color: AppColors.themeColor2
                      ),
                      label: 'Main Course',

                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
const commonTextStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
  color: Colors.black,
);
