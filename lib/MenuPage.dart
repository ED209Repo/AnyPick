import 'package:anypickdemo/APfontsStyle.dart';
import 'package:anypickdemo/MenuPageModel.dart';
import 'package:anypickdemo/NewHomeScreen.dart';
import 'package:anypickdemo/New_Menu_Page.dart';
import 'package:anypickdemo/Widgets/AppColors.dart';
import 'package:flutter/material.dart';
import 'Widgets/custombackbutton.dart';
import 'homeScreen.dart';

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
        builder: (context) => const HomeScreen(), // Replace with your Example widget
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<String> tabLabels = [
      "All Items",
      "Deals",
      "Top Picks",
      "Seafood",
      "Chicken & Lamb",
      "Fast Food",
      "Deserts",
      "Chinese Food",
      "Add ons",
      "Cold Drinks",
    ];

    return DefaultTabController(
      length: tabLabels.length,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.themeColor,
          leading: CustomBackButton(
            onPressed: () => Navigator.of(context).pop(),
          ),
          title:  Text("Menu",
            style: APfontsStyle.customTextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),

          ),
          centerTitle: true,
          bottom: TabBar(
            isScrollable: true,
            tabs: tabLabels.map((label) {
              return Tab(text: label);
            }).toList(),
            onTap: (index) {
              setState(() {
                currentPageIndex = index;
              });
            },
            indicatorColor: AppColors.themeColor,
          ),
        ),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverToBoxAdapter(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.whitetext,
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(10.0), // Adjust the radius as needed
                      bottomLeft: Radius.circular(10.0), // Adjust the radius as needed
                    ),
                  ),
                  child: Stack(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 115,
                              height: 115,
                              child: const ClipOval(
                                child: Image(
                                  image: AssetImage('images/mcdd.jpg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(14),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 40), // Add some space above the text
                                  Text(
                                    'MayField Bakery & Cafe',
                                    style: APfontsStyle.customTextStyle(
                                      color: Colors.grey[600] ?? Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Chinese - American - Desi Food',
                                    style: APfontsStyle.customTextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        top: 20,
                        right: 10,
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: incrementLikeCount,
                              child: Row(
                                children: [
                                   Icon(
                                    Icons.thumb_up,
                                    color: Colors.grey[600],
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
                                   Icon(
                                    Icons.favorite,
                                    color: Colors.grey[600],
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
                    ],
                  ),
                ),


              ),
            ];
          },
          body: CustomScrollView(
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    final item = scrollListModel.items[index];
                    return Container(
                      margin: const EdgeInsets.all(8.0),
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage('images/gradient-3.jpg'),
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
                                        alignment: const Alignment(-0.5, 0),
                                        child: Container(
                                          height: 40,
                                          width: 120,
                                          decoration: BoxDecoration(
                                            color: AppColors.QuantityBGColor.withOpacity(0.1),
                                            borderRadius: BorderRadius.circular(30),
                                          ),
                                          child: Row(
                                            children: [
                                              const SizedBox(width: 15),
                                              Text(
                                                ' SAR ${item.price}',
                                                style: APfontsStyle.customTextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
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
                                            borderRadius: BorderRadius.circular(30),
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    if (item.quantity > 0) {
                                                      item.quantity--;
                                                    }
                                                  });
                                                },
                                                child: Text(
                                                  '-',
                                                  style: APfontsStyle.customTextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                item.quantity.toString(),
                                                style: APfontsStyle.customTextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    item.quantity++;
                                                  });
                                                },
                                                child: Text(
                                                  '+',
                                                  style: APfontsStyle.customTextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
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
                  childCount: scrollListModel.items.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

