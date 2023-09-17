import 'package:flutter/material.dart';
import 'Widgets/AppColors.dart'; // Make sure this import is correct.
import 'card_candidate_model.dart'; // Make sure this import is correct.

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
    remainingHeight -= 47.8;

    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        color: AppColors.themeColor2,
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
      child: Stack(
        children: [
          Column(
            children: [
              Positioned(
                top: 10, // Adjust this value as needed
                left: 10, // Adjust this value as needed
                child: SizedBox(
                  width: 110,
                  height: 110,
                  child: ClipOval(
                    child: Image.network(widget.restaurant.imageUrl),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                widget.restaurant.job,
                style: TextStyle(
                  color: AppColors.whitetext,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                widget.restaurant.city,
                style: TextStyle(
                  color: AppColors.whitetext,
                  fontSize: 15,
                ),
              ),
    ],
          ),
              Padding(
                padding: const EdgeInsets.fromLTRB(120, 10, 16, 0), // Adjust left padding as needed
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        const SizedBox(height: 15),
                        Center(
                          child: Text(
                            widget.restaurant.name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Center(
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
                                ),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                widget.restaurant.likeCount.toString(),
                                style: const TextStyle(fontSize: 16, color: Colors.black),
                              ),
                              const SizedBox(width: 20),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    widget.restaurant.heartCount++;
                                  });
                                },
                                icon: Icon(
                                  widget.restaurant.heartIcon,
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
                        ),

                      ],
                    ),
                  ],
                ),
              ),
            ],

      )





    );
  }
}
