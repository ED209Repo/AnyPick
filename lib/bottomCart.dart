import 'package:anypickdemo/Cart_screen.dart';
import 'package:anypickdemo/New_Payment_Page.dart' show PaymentMethodPage;
import 'package:anypickdemo/VehicleManagement.dart';
import 'package:anypickdemo/processing.dart';
import 'package:flutter/material.dart';
import 'Cart_model.dart';
import 'Widgets/AppColors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class QuantityControl extends StatefulWidget {
  final int initialQuantity;
  final Function(int) onChanged;

  QuantityControl({required this.initialQuantity, required this.onChanged});

  @override
  _QuantityControlState createState() => _QuantityControlState();
}

class _QuantityControlState extends State<QuantityControl> {
  int _quantity = 0;

  @override
  void initState() {
    super.initState();
    _quantity = widget.initialQuantity;
  }

  void decrementQuantity() {
    if (_quantity > 0) {
      setState(() {
        _quantity--;
        widget.onChanged(_quantity);
      });
    }
  }

  void incrementQuantity() {
    setState(() {
      _quantity++;
      widget.onChanged(_quantity);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 40,
        width: 100,
        decoration: BoxDecoration(
          color: AppColors.themeColor.withOpacity(1),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: decrementQuantity,
              child: Text(
                '-',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            SizedBox(width: 0.5),
            Text(
              _quantity.toString(),
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(width: 0.5),
            GestureDetector(
              onTap: incrementQuantity,
              child: Text(
                '+',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class FoodItemList extends StatefulWidget {
  final List<FoodItem> items;

  FoodItemList({required this.items});

  @override
  _FoodItemListState createState() => _FoodItemListState();
}

class _FoodItemListState extends State<FoodItemList> {
  List<int> quantities = [];

  @override
  void initState() {
    super.initState();
    quantities = List<int>.filled(widget.items.length, 0);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(widget.items.length, (index) {
        final item = widget.items[index];
        final quantity = quantities[index];

        return Column(
          children: [
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              leading: ClipOval(
                child: Image.asset(
                  item.imgUrl,
                  width: 56,
                  height: 56,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text('${item.title}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.description),
                  SizedBox(height: 8),
                  QuantityControl(
                    initialQuantity: quantity,
                    onChanged: (newQuantity) {
                      setState(() {
                        quantities[index] = newQuantity;
                        // Handle quantity change here (e.g., update a cart)
                      });
                    },
                  ),
                ],
              ),
              trailing: Text('SR${item.price.toStringAsFixed(2)}'),
            ),
            const Divider(
              color: Colors.white,
              thickness: 1.0,
              indent: 16,
              endIndent: 16,
            ),
          ],
        );
      }),
    );
  }
}
class BottomSheetCart extends StatelessWidget {
  const BottomSheetCart();
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double buttonHeight = screenHeight * 0.06; // Adjust the fraction as needed

    return SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 26),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: _buildListWithBackground(currentItems),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: FractionalOffset.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0), // Add horizontal padding
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CartScreen(),
                      ),
                    );
                    // Implement your proceed payment or repeat order logic here
                  },
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor: MaterialStateProperty.all<Color>(AppColors.themeColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    minimumSize: MaterialStateProperty.all<Size>(
                      Size(double.infinity, buttonHeight),
                    ),
                  ),
                  child: Text(
                      AppLocalizations.of(context)!.checkout
                  ),
                ),
              ),
            ),
          ],
        ),
       );
    }

  Widget _buildListWithBackground(List<FoodItem> items) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(20),
      ),
      child: FoodItemList(items: items), // Use the FoodItemList widget here
    );
  }
}