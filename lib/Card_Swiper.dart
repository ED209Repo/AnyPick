import 'package:flutter/material.dart';

import 'MenuPage.dart';
import 'Widgets/AppColors.dart';
import 'card_candidate_model.dart';

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
    remainingHeight = remainingHeight - 47.8;

    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        color: AppColors.themeColor2,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      alignment: Alignment.center,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.restaurant.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        widget.restaurant.job,
                        style:  TextStyle(
                          color: AppColors.whitetext,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        widget.restaurant.city,
                        style:  TextStyle(color: AppColors.whitetext, fontSize: 15),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                widget.restaurant.likeCount++; // Increment the like count
                              });
                            },
                            child: Icon(
                              widget.restaurant.likeIcons, // Use the correct index
                              color: Colors.blue,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            widget.restaurant.likeCount.toString(),
                            style: const TextStyle(fontSize: 16, color: Colors.black),
                          ),
                          const SizedBox(width: 20),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                widget.restaurant.heartCount++; // Increment the like count
                              });
                            },
                            child: Icon(
                              widget.restaurant.heartIcon, // Use the correct index
                              color: Colors.red,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            widget.restaurant.heartCount.toString(),
                            style: const TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ],
                      ),

                    ]
                ),
              ),
              const SizedBox(height: 18), // Add some space between text and gradient
              FractionallySizedBox(
                widthFactor: 1,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.black12, // Black background
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12), // Top left corner is rounded
                      topRight: Radius.circular(12), // Top right corner is rounded
                    ),
                  ),
                  height: 35, // Adjust the height as needed
                  width: 500,
                  child:  Center(
                    child: Text(
                      "Top Picks",
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
                  decoration: BoxDecoration(
                    image:  DecorationImage(
                      image: NetworkImage(widget.restaurant.backgroundImage),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25,right: 25, top: 25, bottom: 18),
                    child: LayoutBuilder(
                      builder: (BuildContext context, BoxConstraints constraints) {
                        return ListView.builder(
                          itemCount: widget.restaurant.dealNames.length,
                          itemBuilder: (context, index) {
                            var dealName = widget.restaurant.dealNames[index];
                            var dealImage = widget.restaurant.dealImage[index];
                            var isSelected = selectedDeals.contains(CartItem(dealName, dealImage));
                            return Container(
                              height: remainingHeight,
                              decoration: BoxDecoration(
                                backgroundBlendMode: BlendMode.dstOver,
                                borderRadius: BorderRadius.circular(12.0),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: widget.restaurant.color,
                                ),
                              ),

                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  const SizedBox(width: 12),
                                  Container(
                                    width: 55.0, // Adjust this width as needed
                                    height: 50.0, // Adjust this height as needed
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12.0),
                                      child: Image.network(dealImage),
                                    ),
                                  ),
                                  const SizedBox(width: 16.0),
                                  Container(
                                    width: 150, // Adjust this width as needed
                                    child: Text(
                                      dealName,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        if (isSelected) {
                                          selectedDeals.add(CartItem(dealName, dealImage));
                                        } else {
                                          selectedDeals.remove(CartItem(dealName, dealImage));
                                        }
                                      });
                                    },
                                    child: Icon(
                                      isSelected ? Icons.shopping_cart_outlined : Icons.shopping_cart_outlined,
                                      color: Colors.white,
                                      size: 28.0,
                                    ),
                                  ),
                                  const SizedBox(width: 22,)
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 10,
            right: 13,
            child: Container(
              width: 100,
              height: 100,
              child: Image.network(widget.restaurant.imageUrl),
            ),
          ),
        ],
      ),
    );
  }
}