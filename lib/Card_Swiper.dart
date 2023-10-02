import 'package:flutter/material.dart';
import 'ProductPage.dart';
import 'ProductPageModel.dart';
import 'Widgets/AppColors.dart'; // Make sure this import is correct.
import 'card_candidate_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';// Make sure this import is correct.
import 'Cart_screen.dart';


class ExampleCard extends StatefulWidget {
  final ExampleResturantModel restaurant;
  const ExampleCard(this.restaurant, {Key? key}) : super(key: key);

  @override
  _ExampleCardState createState() => _ExampleCardState();
}

class _ExampleCardState extends State<ExampleCard> {
  final Set<CartItem> selectedDeals = {};

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final appBarHeight = AppBar().preferredSize.height;
    final statusBarHeight = MediaQuery.of(context).padding.top;
    var remainingHeight = (screenHeight - (appBarHeight + statusBarHeight)) / 4;
    remainingHeight = remainingHeight < 50 ? 50 : remainingHeight;

    final itemHeight = 50.0; // Adjust this value as needed
    final itemCount = widget.restaurant.dealNames.length;
    final containerHeight = itemHeight * itemCount;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 200,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            color: AppColors.themeColor,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 3,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.topLeft,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
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
                  Padding(
                    padding: const EdgeInsets.fromLTRB(130, 10, 30, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 5),
                            Container(
                              alignment: Alignment.topRight,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        widget.restaurant.likeCount++;
                                      });
                                    },
                                    icon: Icon(
                                      widget.restaurant.likeIcons,
                                      color: Colors.blue,
                                      size: 20,
                                    ),
                                  ),
                                  const SizedBox(width: 1),
                                  Text(
                                    widget.restaurant.likeCount.toString(),
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        widget.restaurant.heartCount++;
                                      });
                                    },
                                    icon: Icon(
                                      widget.restaurant.heartIcon,
                                      color: Colors.red,
                                      size: 20,
                                    ),
                                  ),
                                  const SizedBox(width: 1),
                                  Text(
                                    widget.restaurant.heartCount.toString(),
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            Center(
                              child: Text(
                                widget.restaurant.name,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 26,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                child: Row( // Wrap job and city in a Row
                  children: [
                    Icon(
                      Icons.location_on,
                      color: AppColors.whitetext,
                      size: 20,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      widget.restaurant.city,
                      style: TextStyle(
                        color: AppColors.whitetext,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(width: 10), // Add spacing between job and city
                    Icon(
                      Icons.access_time_filled_rounded,
                      color: AppColors.whitetext,
                      size: 20,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      widget.restaurant.job,
                      style: TextStyle(
                        color: AppColors.whitetext,
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        FractionallySizedBox(
          widthFactor: 1,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
            height: 35,
            width: 500,
            child: Center(
              child: Text(AppLocalizations.of(context)!.firstchoice,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.whitetext,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: containerHeight,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 3,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(22, 22, 22, 10),
                  child: ListView.builder(
                    // physics: const NeverScrollableScrollPhysics(),
                    itemCount: widget.restaurant.dealNames.length,
                    itemBuilder: (context, index) {
                      var dealName = widget.restaurant.dealNames[index];
                      var dealImage = widget.restaurant.dealImage[index];
                      var isSelected = selectedDeals.contains(CartItem(dealName, dealImage));
                      return Column(
                        children: [
                          InkWell(
                            onTap:(){
                              showModalBottomSheet<dynamic>(
                                backgroundColor: Colors.white,
                                isScrollControlled: true,
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20))),
                                context: context,
                                builder: (BuildContext context) {
                                  return Container(
                                    height: MediaQuery.of(context).size.height * 0.6,
                                    width: double.infinity,
                                    child: FoodDetailPage(food: Food.generateRecommendFoods()[0]),
                                  );
                                },
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 0.0), // Adjust the padding as needed
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align title and cart icon
                                children: [
                                  Text(
                                    widget.restaurant.dealNames[index],
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                    ),
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: IconButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => CartScreen(),
                                            ),
                                          );
                                        },
                                        icon: Icon(
                                          isSelected
                                              ? Icons.shopping_cart
                                              : Icons.shopping_cart,
                                          color: Colors.black,
                                          size: 28.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Divider(
                            thickness: 0.5, // Adjust the thickness of the separator line as needed
                            color: Colors.grey, // Adjust the color of the separator line as needed
                          ),
                        ],
                      );
                    },
                  ),

                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
