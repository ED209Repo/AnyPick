import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:anypickdemo/Widgets/AppColors.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'ProductPageModel.dart';

class FoodDetailPage extends StatefulWidget {
  final Food food;

  FoodDetailPage({required this.food});

  @override
  _FoodDetailPageState createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  int heartCount = 0; // Initialize heart count
  int quantity = 0; // Initialize quantity here

  // Increment quantity
  void incrementQuantity() {
    setState(() {
      if (quantity < 10) {
        quantity++;
      }
    });
  }

  // Decrement quantity
  void decrementQuantity() {
    setState(() {
      if (quantity > 0) {
        quantity--;
      }
    });
  }

  Future<void> _showAddonOptionDialog(BuildContext context, String addonName) async {
    final List<String> options = ['Small', 'Medium', 'Large', 'XL', 'XXL'];
    String? selectedOption;
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              backgroundColor: kPrimaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.0),
              ),
              title: Text('Select $addonName'),
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
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: TextButton(
                    onPressed: () {
                      // Perform actions with the selected option here
                      print('Selected $addonName Option: $selectedOption');
                      Navigator.of(context).pop(); // Close dialog after saving
                    },
                    child: const Text('Save'),
                  ),
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
    final mediaQuery = MediaQuery.of(context);
    return Container(
      decoration:  BoxDecoration(
        color: AppColors.themeColor,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      child: Scaffold(
        backgroundColor:  AppColors.themeColor,
        body: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 20,
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).padding.top + 30,
                        left: 25,
                        right: 25,
                      ),
                    ),
                    Container(
                      height: 200,
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
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(50),
                                    ),
                                    color: kBackground, // Use an appropriate color
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              margin: const EdgeInsets.all(15),
                              width: 120,
                              height: 120,
                              child: ClipOval(
                                child: Image.asset(
                                  widget.food.imgUrl!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(25),
                      color: kBackground, // Use an appropriate color
                      child: Column(
                        children: [
                          Text(
                            widget.food.name!,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.access_time_outlined,
                                    color: Colors.blue,
                                  ),
                                  Text(
                                    widget.food.waitTime!,
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                  const SizedBox(width: 10),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            width: double.maxFinite,
                            height: 50,
                            child: Stack(
                              children: [
                                Align(
                                  alignment: const Alignment(-0.5, 0),
                                  child: Container(
                                    height: 80,
                                    width: 140,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Row(
                                      children: [
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        const Text(
                                          'SR',
                                          style: TextStyle(
                                              fontSize: 13, fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          widget.food.price.toString(),
                                          style: const TextStyle(
                                              fontSize: 20, fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    height: 80,
                                    width: 120,
                                    decoration: BoxDecoration(
                                      color: AppColors.themeColor, // Use an appropriate color
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        GestureDetector(
                                          onTap: decrementQuantity,
                                          child: const Text(
                                            '-',
                                            style: TextStyle(
                                                fontSize: 20, fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Text(
                                          quantity.toString(),
                                          style: const TextStyle(
                                              fontSize: 20, fontWeight: FontWeight.bold),
                                        ),
                                        GestureDetector(
                                          onTap: incrementQuantity,
                                          child: const Text(
                                            '+',
                                            style: TextStyle(
                                                fontSize: 20, fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Row(
                            children: [
                              Text(
                                'Add-ons',
                                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                              )
                            ],
                          ),
                          const SizedBox(height: 10),
                          Container(
                            height: 100,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                if (index < widget.food.addons!.length) {
                                  final String addonName = widget.food.addons![index].keys.first;
                                  return GestureDetector(
                                    onTap: () {
                                      if (widget.food.addons != null &&
                                          index < widget.food.addons!.length) {
                                        _showAddonOptionDialog(context, addonName);
                                      }
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(40),
                                      ),
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            widget.food.addons![index].values.first,
                                            width: 52,
                                          ),
                                          Text(addonName),
                                        ],
                                      ),
                                    ),
                                  );
                                } else {
                                  return const SizedBox();
                                }
                              },
                              separatorBuilder: (_, index) => const SizedBox(
                                width: 15,
                              ),
                              itemCount: widget.food.addons != null ? widget.food.addons!.length : 0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
        floatingActionButton:                               Container(
          width: 100,
          height: 56,
          child: RawMaterialButton(
            onPressed: () async{
              CoolAlert.show(
                  context:context,
                  type: CoolAlertType.loading,
                  text: AppLocalizations.of(context)!.productadded,
                  autoCloseDuration: const Duration(seconds: 2),
                  backgroundColor: const Color(0xffF5A896),
                  animType: CoolAlertAnimType.scale,
                  lottieAsset: "images/CartS.json"
              );
              await Future.delayed(const Duration(milliseconds: 2000));
              Navigator.pop(context);
              // Implement your shopping bag logic here
            },
            fillColor: kPrimaryColor, // Use an appropriate color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            elevation: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.white,
                  size: 30,
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: const BoxDecoration(
                    color: kBackground,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                   quantity!.toString(),
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
        ) ,
      ),
    );
  }
}
