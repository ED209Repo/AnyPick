import 'package:anypickdemo/MenuPageModel.dart';
import 'package:flutter/material.dart';
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
        builder: (context) => const Example(), // Replace with your Example widget
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final containerHeight = MediaQuery.of(context).size.height * 0.3;
    final double fontSize = MediaQuery.of(context).size.width < 600 ? 14 : 18;
    final commonTextStyle = TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
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
                  height: 140,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: MenuPageModel.items.length,
                    itemBuilder: (BuildContext context, int index) {
                      final menuItem = MenuPageModel.items[index];
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          width: 120,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          color: Colors.grey[300],
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
                                padding: const EdgeInsets.only(
                                    left: 8.0, bottom: 8.0),
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
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(width: 10),
                      Text('Starter'),
                      SizedBox(width: 20),
                      Text('Main Course'),
                      SizedBox(width: 20),
                      Text('Appetizers'),
                      SizedBox(width: 20),
                      Text('Seafood'),
                      SizedBox(width: 20),
                      Text('Chicken & Lamb'),
                      SizedBox(width: 20),
                      Text('Fast Food'),
                      SizedBox(width: 20),
                      Text('Deserts'),
                      SizedBox(width: 20),
                      Text('Chinese Food'),
                      SizedBox(width: 20),
                      Text('Add ons'),
                      SizedBox(width: 20),
                      Text('Cold Drinks'),
                      SizedBox(width: 20),
                      // Add more Text widgets as needed
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                SingleChildScrollView(
                  child: Container(
                    width: double.infinity,
                    height: 250,
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
                              Container(
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
                                    Text(
                                      item.title,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22.0,
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
                                    SizedBox(height: 10),
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
                                        Text(
                                          '${item.count}',
                                          style: const TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.green,
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
                              ),
                            ],
                          ),
                        );
                      },
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
