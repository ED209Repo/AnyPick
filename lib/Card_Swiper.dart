import 'package:anypickdemo/APfontsStyle.dart';
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
          height: 150,
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
                      padding: const EdgeInsets.fromLTRB(10, 35, 10, 0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          const BoxShadow(
                            color: Colors.black45,
                            blurRadius: 2,
                            spreadRadius: 3,
                            offset: Offset(0,6),
                          ),
                        ]
                      ),
                      width: 100,
                      height: 100,
                      child:  ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: const Image(
                          image: AssetImage('images/newlogo.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(120, 35, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(height: 5),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    widget.restaurant.name,
                                    style: APfontsStyle.customTextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 26,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: AppColors.whitetext,
                                    size: 20,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    widget.restaurant.city,
                                    style: APfontsStyle.customTextStyle(
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
                                    style: APfontsStyle.customTextStyle(
                                      color: AppColors.whitetext,
                                      fontSize: 17,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        widget.restaurant.likeCount++;
                                      });
                                    },
                                    icon: Icon(
                                      widget.restaurant.likeIcons,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                  const SizedBox(width: 1),
                                  Text(
                                    widget.restaurant.likeCount.toString(),
                                    style: APfontsStyle.customTextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
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
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                  const SizedBox(width: 1),
                                  Text(
                                    widget.restaurant.heartCount.toString(),
                                    style: APfontsStyle.customTextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        FractionallySizedBox(
          widthFactor: 1,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            height: 36,
            width: 500,
            child: Center(
              child: Text(AppLocalizations.of(context)!.firstchoice,
              textAlign: TextAlign.center,
                style: APfontsStyle.customTextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.blackColor,
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
                bottomLeft: Radius.circular(10),
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
            child:LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
              return Padding(
              padding: const EdgeInsets.fromLTRB(22, 22, 22, 10),
                 child: GridView.builder(
                     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                     childAspectRatio: 1,
                   crossAxisCount: 2, // Number of columns in the grid
                  crossAxisSpacing: 15.0, // Spacing between columns
                  mainAxisSpacing: 15.0, // Spacing between rows
                  ),
                  itemCount: widget.restaurant.dealNames.length,
                  itemBuilder: (context, index) {
                  var dealName = widget.restaurant.dealNames[index];
                     var dealImage = widget.restaurant.dealImage[index];
                  var isSelected =
                   selectedDeals.contains(CartItem(dealName, dealImage));
                  return  Container(
                   decoration: BoxDecoration(
                   border: Border.all(color: Colors.grey, width: 1.0),
                     borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15),
                         topLeft: Radius.circular(15), topRight: Radius.circular(15)),
            ),
                   child:
                    InkWell(
                     onTap: () {
                        showModalBottomSheet<dynamic>(
                          backgroundColor: Colors.white,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                ),
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.7,
                    width: double.infinity,
                    child: FoodDetailPage(
                      food: Food.generateRecommendFoods()[0],
                    ),
                  );
                },
              );
            },
            child: Container(
              padding: const EdgeInsets.all(4), // Adjust padding as needed
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children:<Widget> [
                      Container(
                        width: 150,
                        height: 60,
                          child: const Image(
                            image: AssetImage('images/mcdd.png'),
                            fit: BoxFit.cover,
                          ),
                      ),
                      Container(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CartScreen(),
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
                    ),]
                  ),
                  Text(
                    widget.restaurant.dealNames[index],
                    style: APfontsStyle.customTextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ));
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
