import 'package:anypickdemo/APfontsStyle.dart';
import 'package:anypickdemo/MenuPage.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'BrowseScreenModel.dart';

class TryScreen extends StatefulWidget {
  const TryScreen({Key? key});

  @override
  State<TryScreen> createState() => _TryScreenState();
}

Widget categoriesContainer({required String image, required String name}) {
  return Column(
    children: [
      SizedBox(
        width: 80,
        height: 80,
        child: Card(
          color: Colors.grey,
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          elevation: 10,
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1.0,),
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
      Text(name,
        style: APfontsStyle.customTextStyle(
          fontSize: 17,
          fontWeight: FontWeight.normal,
        ),),
    ],
  );
}


class _TryScreenState extends State<TryScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<browseItem> filteredItems = List.from(BrowseItemModel.items);

  void _performSearch(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredItems = List.from(BrowseItemModel.items);
      } else {
        filteredItems = BrowseItemModel.items
            .where((item) =>
        item.title.toLowerCase().contains(query.toLowerCase()) ||
            item.Description.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children:[Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(height: 12),
                Container(
                  height: 120.0,
                  child: Swiper(
                    itemCount: items.length, // Use the length of the items list
                    itemWidth: 300.0,
                    viewportFraction: 1,
                    scale: 0.9,
                    autoplay: true,
                    loop: true,
                    duration: 200,
                    itemBuilder: (BuildContext context, int index) {
                      final advertisementModel = items[index];
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          advertisementModel.imageUrl, // Access the imageUrl property
                          fit: BoxFit.fill,
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 12),
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
                const SizedBox(height: 12),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: filteredItems.length,
                        itemBuilder: (BuildContext context, int index) {
                          final browseItem = filteredItems[index];
                          return Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.all(8.0),
                                padding: const EdgeInsets.only(top: 10.0,bottom: 10.0),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 90.0,
                                      height: 90.0,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(12.0),
                                        child: Image.asset(
                                          browseItem.imageUrl,
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
                                                  builder: ((context) => MenuPage()),
                                                ),
                                              );
                                            },
                                            child: Row(
                                              children: [
                                                Text(
                                                  '${browseItem.title}  ${browseItem.titleArabic}',
                                                  style: APfontsStyle.customTextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize:15,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                Icon(Icons.verified,color: Colors.red,size: 15,)
                                              ],
                                            ),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            '${browseItem.Description}',
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: APfontsStyle.customTextStyle(
                                              color: Colors.grey,
                                            ),
                                          ),
                                          const SizedBox(height: 17),
                                          Container(
                                            alignment: Alignment.bottomRight,
                                            child: Wrap(
                                              children: [
                                                const Icon(
                                                  Icons.directions_car,
                                                  color: Colors.grey,
                                                  size: 20,
                                                ),
                                                Text(
                                                  ' ${browseItem.time}',
                                                  maxLines: 2,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: APfontsStyle.customTextStyle(
                                                    color: Colors.grey,
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
                              if (index < filteredItems.length - 1) Divider(thickness: 1.5), // Add a divider if not the last item
                            ],
                          );
                        },
                      )

                    ],
                  ),
                )
              ],
            ),
          ),]
        ),
      ),
    );
  }
}
class AdvertismentModel {
  String imageUrl;

  AdvertismentModel({
    required this.imageUrl,
  });
}

final List<AdvertismentModel> items = [
  AdvertismentModel(
    imageUrl: 'images/deal1.jpg',
  ),
  AdvertismentModel(
    imageUrl: 'images/deal2.jpg',

  ),
  AdvertismentModel(
    imageUrl: 'images/deal3.jpg',
  ),
  AdvertismentModel(
    imageUrl: 'images/deal4.jpg',
  ),
];