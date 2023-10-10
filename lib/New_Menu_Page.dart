import 'package:flutter/material.dart';

class Food2 {
  String? imgUrl;
  String? desc;
  String? name;
  String? waitTIme;
  num? score;
  num? price;
  num? quantity;
  List<Map<String, String>>? Addons;
  String? about;
  bool highLight;

  Food2({
    this.imgUrl,
    this.desc,
    this.name,
    this.waitTIme,
    this.score,
    this.price,
    this.quantity,
    this.Addons,
    this.about,
    this.highLight = false,
  });

  static List<Food2> generateRecommendFoods2() {
    return [
      Food2(
        imgUrl: 'images/hardess.jpg',
        desc: 'Most Popular',
        name: 'Beef Burger',
        waitTIme: '40min',
        score: 4.8,
        price: 12,
        quantity: 1,
        Addons: [
          {'Serving size': 'images/size2.png'},
          {'Drink': 'images/drink2.png'},
          {'Fries': 'images/fries1.png'},
          {'Sauces': 'images/sauce.png'},
        ],
        about:
        'Two chargrilled 100% all-beef patties, topped with two slices of melted American cheese, covered in unique Special sauce, mayo, dill pickles, fresh tomatoes, onions and crunchy lettuce, all in our special toasted Hardees bun.',
        highLight: false,
      ),
    ];
  }
}

class FoodImg extends StatelessWidget {
  final Food2? food2;

  FoodImg({this.food2});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(50),
                    ),
                    color: kBackground,
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: const EdgeInsets.all(15),
              width: 220,
              height: 220,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.red.withOpacity(0.2),
                    offset: const Offset(-4, 10),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: ClipOval(
                child: Image.asset(
                  food2!.imgUrl!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FoodDetail extends StatelessWidget {
  final Food2? food2;

  FoodDetail({this.food2});

  Future<void> _showAddonOptionDialog(BuildContext context, String addonName) async {
    final List<String> options = ['Option 1', 'Option 2', 'Option 3'];
    String? selectedOption;

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text('Select $addonName '),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: options.map((option) {
                  return ListTile(
                    title: Text(option),
                    leading: Radio<String>(
                      value: option,
                      groupValue: selectedOption,
                      onChanged: (value) {
                        setState(() {
                          selectedOption = value;
                        });
                      },
                    ),
                  );
                }).toList(),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    // Perform actions with the selected option here
                    print('Selected $addonName Option: $selectedOption');
                    Navigator.of(context).pop(); // Close dialog after saving
                  },
                  child: Text('Save'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      color: kBackground,
      child: Column(
        children: [
          Text(
            food2!.name!,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildIconText(
                Icons.access_time_outlined,
                Colors.blue,
                food2!.waitTIme!,
              ),
              _buildIconText(
                Icons.star_outlined,
                Colors.amber,
                food2!.score!.toString(),
              ),
            ],
          ),
          const SizedBox(
            height: 39,
          ),
          FoodQuantity(food2: food2),
          SizedBox(
            height: 39,
          ),
          Row(
            children: [
              Text(
                'Add-ons',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
              )
            ],
          ),
          SizedBox(height: 10),
          Container(
            height: 100,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                if (index < food2!.Addons!.length) {
                  final String addonName = food2!.Addons![index].keys.first;
                  return GestureDetector(
                    onTap: () {
                      if (food2!.Addons != null && index < food2!.Addons!.length) {
                        _showAddonOptionDialog(context, addonName);
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            food2!.Addons![index].values.first,
                            width: 52,
                          ),
                          Text(addonName),
                        ],
                      ),
                    ),
                  );
                } else {
                  return SizedBox();
                }
              },
              separatorBuilder: (_, index) => SizedBox(
                width: 15,
              ),
              itemCount: food2!.Addons != null ? food2!.Addons!.length : 0,
            ),
          ),
          const SizedBox(
            height: 39,
          ),
          const SizedBox(height: 20),
          const Row(
            children: [
              Text(
                'About',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            food2!.about!,
            style: const TextStyle(fontSize: 16, wordSpacing: 1.2, height: 1.5),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildIconText(IconData icon, Color color, String text) {
    return Row(
      children: [
        Icon(
          icon,
          color: color,
        ),
        Text(
          text,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}

class FoodQuantity extends StatefulWidget {
  final Food2? food2;

  const FoodQuantity({Key? key, this.food2}) : super(key: key);

  @override
  _FoodQuantityState createState() => _FoodQuantityState();
}

class _FoodQuantityState extends State<FoodQuantity> {
  int quantity = 1; // Initial quantity

  void incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decrementQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 40,
      child: Stack(
        children: [
          Align(
            alignment: Alignment(-0.5, 0),
            child: Container(
              height: 40,
              width: 120,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(children: [
                SizedBox(
                  width: 15,
                ),
                Text(
                  'SR',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                ),
                Text(
                  widget.food2!.price.toString(),
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 40,
              width: 100,
              decoration: BoxDecoration(
                color: kPrimaryColor.withOpacity(1),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: decrementQuantity,
                    child: Text(
                      '-',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    quantity.toString(),
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: incrementQuantity,
                    child: Text(
                      '+',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final Food2 food2;

  const DetailPage({
    Key? key,
    required this.food2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(
              leftIcon: Icons.arrow_back,
              rightIcon: Icons.favorite_outline,
              leftCallback: () => Navigator.pop(context),
            ),
            FoodImg(
              food2: food2,
            ),
            FoodDetail(
              food2: food2,
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        width: 100,
        height: 56,
        child: RawMaterialButton(
          onPressed: () {},
          fillColor: kPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          elevation: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Icon(
                Icons.shopping_bag_outlined,
                color: Colors.black,
                size: 30,
              ),
              Container(
                padding: const EdgeInsets.all(15),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  food2!.quantity!.toString(),
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  final IconData leftIcon;
  final IconData rightIcon;
  final Function()? leftCallback;

  const CustomAppBar({
    Key? key,
    required this.leftIcon,
    required this.rightIcon,
    this.leftCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top +40,
        left: 25,
        right: 25,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: leftCallback != null ? () => leftCallback!() : null,
            child: _buildIcon(leftIcon),
          ),
          _buildIcon(rightIcon),
        ],
      ),
    );
  }

  Widget _buildIcon(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: Icon(icon),
    );
  }
}
const Color kPrimaryColor = Color(0xFFF5A896);
const Color kBackground = Color(0xBAF5F5F5);