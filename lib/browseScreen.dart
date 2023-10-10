import 'package:anypickdemo/APfontsStyle.dart';
import 'package:anypickdemo/MenuPage.dart';
import 'package:anypickdemo/Widgets/custombackbutton.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'BrowseScreenModel.dart';
import 'Widgets/AppColors.dart';

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
          fontWeight: FontWeight.bold,
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
      appBar: PreferredSize(preferredSize: Size.fromHeight(65),
          child: AppBar(
            toolbarHeight: 60.0,
            backgroundColor: AppColors.themeColor,
            leading: CustomBackButton(
  onPressed: () => Navigator.of(context).pop(),
),
          
            title: Padding(
              padding: const EdgeInsets.only(top: 12),
              child: SizedBox(
                height: 45,
                width: 300,
                child: TextField(
                  controller: _searchController,
                  onChanged: (query) {
                    _performSearch(query);
                  },
                  decoration: InputDecoration(
                    hintText: AppLocalizations.of(context)!.searchfood ,
                    alignLabelWithHint: true,
                    hintStyle: APfontsStyle.customTextStyle(
                      color: Colors.grey,
                    ),
                    prefixIcon: const Icon(Icons.search, color: Colors.grey),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.blackColor,
                        width: 1,
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
              ),
            ),
            centerTitle: true,
          )),
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
                            return Container(
                              margin: const EdgeInsets.all(8.0),
                              padding: const EdgeInsets.all(12.0),
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                  image: AssetImage('images/gradient-3.jpg'), // Replace with your background image path
                                  fit: BoxFit.cover,
                                ),
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
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
                                            onTap: (){
                                              Navigator.push(
                                                context, 
                                              MaterialPageRoute(
                                                builder: ((context) => MenuPage()),
                                                ));
                                            },
                                            child: Text(
                                              browseItem.title,
                                              style: APfontsStyle.customTextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 22.0,
                                                color: Colors.white
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            '${browseItem.Description}',
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: APfontsStyle.customTextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          const SizedBox(height: 17),
                                          Container(
                                            alignment: Alignment.bottomRight,
                                            child: Wrap(
                                              children:[
                                                const Icon(Icons.delivery_dining,
                                                    color: Colors.white,
                                                    size: 20,
                                                ),
                                                Text(
                                                  ' ${browseItem.time}',
                                                  maxLines: 2,
                                                  overflow: TextOverflow.ellipsis,
                                                  style:  APfontsStyle.customTextStyle(
                                                    
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )),
                                ],
                              ),
                            );
                          })
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