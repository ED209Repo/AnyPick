import 'package:anypickdemo/MenuPage.dart';
import 'package:anypickdemo/Request_Model.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TryScreen extends StatefulWidget {
  const TryScreen({Key? key});

  @override
  State<TryScreen> createState() => _TryScreenState();
}

class _TryScreenState extends State<TryScreen> {
   NearByRestaurantsController _controller = NearByRestaurantsController();
   late Future<List<RestaurantModel>> futureData;

  @override
  void initState() {
    super.initState();
    _controller = NearByRestaurantsController();
    futureData = _controller.fetchNearbyRestaurants();
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
        Text(
          name,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  Container(
                    height: 120.0,
                    child: Swiper(
                      itemCount: items.length,
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
                            advertisementModel.imageUrl,
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
                    child: FutureBuilder(
                      future: futureData,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else if (snapshot.hasData) {
                           List<RestaurantModel> restaurants = (snapshot.data as List).cast<RestaurantModel>();
                        // Move the setState outside of the build method
                        WidgetsBinding.instance?.addPostFrameCallback((_) {
                          setState(() {
                            _controller.restaurants = restaurants;
                          });
                        });
                          return Column(
                            children: [
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemCount: restaurants.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final RestaurantModel restaurant = restaurants[index];
                                  return Column(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.all(8.0),
                                        padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                                        child: Row(
                                          children: [
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
                                                          builder: ((context) =>  MenuPage(restaurant: restaurant,)),
                                                        ),
                                                      );
                                                    },
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          '${restaurant.restaurant_Name}',
                                                          style: const TextStyle(
                                                            fontWeight: FontWeight.bold,
                                                            fontSize: 15,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                        const Icon(Icons.verified, color: Colors.red, size: 15)
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(height: 5),
                                                  Text(
                                                    '${restaurant.open_Close_Time}',
                                                    maxLines: 2,
                                                    overflow: TextOverflow.ellipsis,
                                                    style: const TextStyle(
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
                                                          ' ${restaurant.off_days}',
                                                          maxLines: 2,
                                                          overflow: TextOverflow.ellipsis,
                                                          style: const TextStyle(
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
                                      if (_controller.restaurants.length > 1 && restaurant != _controller.restaurants.last)
                                        const Divider(), // Add a divider if not the last item
                                    ],
                                  );
                                },
                              )
                            ],
                          );
                        } else {
                          return const Text('No data available');
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}    


class NearByRestaurantsController {
  List<RestaurantModel> restaurants = [];
   Future<List<RestaurantModel>> fetchNearbyRestaurants() async {
  try {
    var client = http.Client();
    var uri = Uri.parse('https://my-json-server.typicode.com/ED209Repo/demoAPI/NearR');
    var response = await client.get(uri);
    
    if (response != null && response.statusCode == 200) {
      var data = json.decode(response.body);
      var rest = data["data"] as List;
      var restaurants = rest.map((data) => RestaurantModel.fromJson(data)).toList();
      print(restaurants[0].restaurant_Name);
      print(restaurants.length);
      return restaurants;
    } else {
      // Handle error
      print('Failed to fetch nearby restaurants. Status code: ${response?.statusCode}');
      print('Response body: ${response?.body}');
      throw Exception('Failed to fetch nearby restaurants');
    }
  } catch (e) {
    // Handle exception
    print('Error: $e');
    throw Exception('Error: $e');
  }
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