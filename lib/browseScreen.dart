import 'dart:ui' as ui;
import 'package:flutter/material.dart';

import 'BrowseScreenModel.dart';
import 'Widgets/AppColors.dart';

class BrowseScreen extends StatefulWidget {
  const BrowseScreen({Key? key});

  @override
  State<BrowseScreen> createState() => _BrowseScreenState();
}

class _BrowseScreenState extends State<BrowseScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<browseItem> filteredItems = List.from(BrowseItemModel.items);

  Widget categoriesContainer({required String image, required String name}) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 10),
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(image)),
            color: Colors.grey,
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        const SizedBox(height: 7),
        Text(
          name,
          style: TextStyle(
            color: AppColors.blackColor,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  void _performSearch(String query) {
    setState(() {
      filteredItems = BrowseItemModel.items
          .where((item) =>
          item.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final containerHeight = MediaQuery.of(context).size.height * 0.3;
    final double fontSize = MediaQuery.of(context).size.width < 600 ? 14 : 18;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 3),
              child: Row(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: const Icon(Icons.arrow_back_ios_new),
                    ),
                  ),
                  const Expanded(child: Text("Browse",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),)),
                ],
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _searchController,
              onChanged: (query) {
                _performSearch(query);
              },
              decoration: InputDecoration(
                hintText: "Search Food",
                hintStyle: const TextStyle(
                  color: Colors.black,
                ),
                prefixIcon: Icon(Icons.search, color: AppColors.themeColor2),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.themeColor2,
                    width: 3,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.themeColor2,
                    width: 3,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 15),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  categoriesContainer(
                    image: 'images/burger.png',
                    name: "Burger",
                  ),
                  categoriesContainer(
                    image: 'images/pizza.png',
                    name: "Pizza",
                  ),
                  categoriesContainer(
                    image: 'images/breakfast.png',
                    name: "Breakfast",
                  ),
                  categoriesContainer(
                    image: 'images/cake.png',
                    name: "Bakery",
                  ),
                  categoriesContainer(
                    image: 'images/dish.png',
                    name: "Dish",
                  ),
                  categoriesContainer(
                    image: 'images/burger.png',
                    name: "All",
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                ),
                itemCount: filteredItems.length,
                itemBuilder: (BuildContext context, int index) {
                  final browseItem = filteredItems[index];
                  return Card(
                    elevation: 2.0,
                    margin: const EdgeInsets.all(5.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Container(
                      height: 200,
                      width: 150,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          // colorFilter:  ColorFilter.mode(Colors.black.withOpacity(0.5),
                          //     BlendMode.dstATop),
                          image: AssetImage('images/kfc.jpg'),
                          fit: BoxFit.cover,
                        ),
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Stack(
                        children: [
                      Padding(
                        padding: const EdgeInsets.only(),
                        child: Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                        // <-- clips to the 200x200 [Container] below
                        child: BackdropFilter(
                        filter: ui.ImageFilter.blur(
                        sigmaX: 5.0,
                          sigmaY: 5.0,
                        ),
                        child: SizedBox(
                          height: 500,
                          width: 200,
                          child:Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  browseItem.title,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              Padding(padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                              child: Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [ const Icon(Icons.timer_outlined,
                                color: Colors.white,
                                size: 15,),
                                  Text  (
                                    browseItem.time,
                                    style: TextStyle(
                                      color: AppColors.whitetext,
                                      fontSize: 15,
                                    ),
                                  ),
                              ],),),
                              Padding(padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                              child: Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  const Icon(Icons.location_on,
                                    color: Colors.white,
                                    size: 15,),
                                  Text(
                                    browseItem.Location,
                                    style: TextStyle(
                                      color: AppColors.whitetext,
                                      fontSize: 15,
                                    ),
                                  ),
                              ]),),
                            ],
                          ),
                          // const SizedBox(height: 5),
                          // Text(
                          //   browseItem.time,
                          //   style: TextStyle(
                          //     color: AppColors.whitetext,
                          //     fontSize: 15,
                          //   ),
                          // ),
                          // const SizedBox(height: 5),
                        ),
                    ),
                  ),
                  ),
                      ),
                  ]),
                  ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
