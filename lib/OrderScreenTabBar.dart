import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'OrdersModel.dart';
import 'Widgets/AppColors.dart';

class OrderScreenTabbar extends StatefulWidget {
  @override
  _OrderScreenTabbar createState() =>
      _OrderScreenTabbar();
}

class _OrderScreenTabbar
    extends State<OrderScreenTabbar> {
  int _currentIndex = 0;
  final GlobalKey<ExpansionTileCardState> cardA = GlobalKey();
  int currentOrderIndex = 0;

  List<Order> orders = OrderModel.items;

  final List<String> _segments = ["Current", "Ready to Pick", "History"];

  @override
  Widget build(BuildContext context) {
    bool allOrdersProcessed = currentOrderIndex >= orders.length;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left:12,right: 12),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.themeColor, // Change to your desired color
            ),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: _segments
                  .asMap()
                  .entries
                  .map(
                    (MapEntry<int, String> entry) => GestureDetector(
                  onTap: () {
                    setState(() {
                      _currentIndex = entry.key;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: _currentIndex == entry.key
                          ?  AppColors.themeColor
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      entry.value,
                      style: TextStyle(
                        color: _currentIndex == entry.key
                            ? Colors.white
                            : Colors.white,
                      ),
                    ),
                  ),
                ),
              )
                  .toList(),
            ),
          ),
        ),
        const SizedBox(height: 20),
        IndexedStack(
          index: _currentIndex,
          children: <Widget>[
            // Content for Segment 1
            Container(
              height: 300,
              width: double.infinity,
              child: allOrdersProcessed
                  ? Center(
                child: Text(
                  "All orders have been processed.",
                  style: TextStyle(
                    color: AppColors.themeColor2,
                    fontSize: 18.0,
                  ),
                ),
              ) : ListView(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: ExpansionTileCard(
                      expandedColor: AppColors.themeColor,
                      expandedTextColor: Colors.white,
                      baseColor:  AppColors.themeColor,
                      key: cardA,
                      leading:  CircleAvatar(child:  ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: Image.asset(
                          orders[currentOrderIndex].imageUrl, // Access imageUrl for the current order
                          fit: BoxFit.cover,
                        ),
                      ),),
                      title:  Text('Title: ${orders[currentOrderIndex].title}',style: const TextStyle(color: Colors.white),),
                      subtitle: Text('Order No: ${orders[currentOrderIndex].orderNo}',style: const TextStyle(color: Colors.white)),
                      children: <Widget>[
                        const Divider(
                          thickness: 1.0,
                          height: 1.0,
                        ),
                        Column(
                          children: <Widget>[
                            ListTile(
                              tileColor: AppColors.themeColor,
                              title:  Text('${orders[currentOrderIndex].description}',style: const TextStyle(
                                color: Colors.white,
                              ),),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Content for Segment 2
            Container(
              height: 300,
              width: double.infinity,
              child: const Center(
                child: Text("Segment 2 Content"),
              ),
            ),
            // Content for Segment 3
            Container(
              height: 300,
              width: double.infinity,
              child: const Center(
                child: Text("Segment 3 Content"),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
