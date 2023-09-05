import 'package:flutter/material.dart';

import 'MenuPageModel.dart';
import 'homeScreen.dart';
class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
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
        builder: (context) => Example(), // Replace with your Example widget
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final containerHeight = MediaQuery.of(context).size.height * 0.3;
    return Scaffold(
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: containerHeight,
                child: PageView.builder(
                  itemCount: ImageList.images.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      width: double.infinity,
                      child: Image.network(
                        ImageList.images[index].imageUrl,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
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
              const SizedBox(height: 15),
              const Padding(
                padding: EdgeInsets.fromLTRB(14, 0, 0, 0),
                child: Text(
                  'Top Picks',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Container(
                height: 140, // Adjust the height of each cell as needed
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: MenuPageModel.items.length,
                  itemBuilder: (BuildContext context, int index) {
                    final menuItem = MenuPageModel.items[index];
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Container(
                        width: 120, // Adjust the width of each cell as needed
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        color: Colors.grey[300], // Replace with your cell background color
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Image.network(
                                menuItem.imageUrl,
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                menuItem.title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                              child: Text(
                                menuItem.dishType,
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(width: 10), // Initial padding
                    Text('Starter', style: commonTextStyle),
                    SizedBox(width: 20), // Adjust the spacing as needed
                    Text('Main Course', style: commonTextStyle),
                    SizedBox(width: 20), // Adjust the spacing as needed
                    Text('Appetizers', style: commonTextStyle),
                    SizedBox(width: 20),
                    Text('Seafood', style: commonTextStyle),
                    SizedBox(width: 20),
                    Text('Chicken & Lamb', style: commonTextStyle),
                    SizedBox(width: 20),
                    Text('Fast Food', style: commonTextStyle),
                    SizedBox(width: 20),
                    Text('Deserts', style: commonTextStyle),
                    SizedBox(width: 20),
                    Text('Chinese Food', style: commonTextStyle),
                    SizedBox(width: 20),
                    Text('Add ons', style: commonTextStyle),
                    SizedBox(width: 20),
                    Text('Cold Drinks', style: commonTextStyle),
                    SizedBox(width: 20),
                    // Add more Text widgets as needed
                  ],
                ),
              )
            ],
          ),
          Positioned(
            top: 20,
            left: 10,
            child: GestureDetector(
              onTap: navigateToExamplePage,
              child: Container(
                width: 30,
                height: 30,
                color: Colors.grey.withOpacity(0.2), // Semi-transparent overlay
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
    );
  }
}

const commonTextStyle = TextStyle(
  fontSize: 18, // Adjust the font size as needed
  fontWeight: FontWeight.bold, // Adjust the font weight as needed
  color: Colors.black, // Adjust the color as needed
);