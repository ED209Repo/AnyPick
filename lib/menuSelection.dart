import 'package:anypickdemo/MenuPage.dart';
import 'package:anypickdemo/MenuPageModel.dart';
import 'package:anypickdemo/Request_Model.dart';
import 'package:anypickdemo/Widgets/CustomButton2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class menuSelection extends StatefulWidget {
  final String title;
  final String description;
  final List<String> options;
  final List<String> flavors;
  final List<String> AdsOn;

  const menuSelection({Key? key, 
    required this.title,
    required this.description,
    required this.options,
    required this.flavors,
    required this.AdsOn,
  }) : super(key: key);

  @override
  _menuSelectionState createState() => _menuSelectionState();
}

class _menuSelectionState extends State<menuSelection> {
  int selectedOptionIndex = -1;
  int selectedFlavorIndex = -1;
  int selectedAdsOnIndex = -1;

  @override
  Widget build(BuildContext context) {
    // Calculate container height based on screen size
    final containerHeight = MediaQuery.of(context).size.height * 0.3;

    return Scaffold(
      body: Column(
        children: [
          // Top container with an image and close button
          SizedBox(
            height: containerHeight,
            child: Stack(
              children: [
                // PageView for displaying images
                PageView.builder(
                  itemCount: ImageList.images.length,
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: double.infinity,
                      child: Image.network(
                        ImageList.images[index].imageUrl,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
                // Close button positioned at the top-left corner
                Positioned(
                  top: 20,
                  left: 10,
                  child: GestureDetector(
                    onTap: () {
                      RestaurantModel restaurant = RestaurantModel(
                        rest_Cat: null
  // initialize the properties with the required values
);
                      // Navigate back to the MenuPage when the close button is pressed
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  MenuPage(restaurant: restaurant ,),
                        ),
                      );
                    },
                    child: Container(
                      width: 30,
                      height: 30,
                      color: Colors.grey.withOpacity(0.5),
                      child: const Icon(
                        Icons.cancel,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Display title and description below the image
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22.0,
                  ),
                ),
                const SizedBox(height: 8), // Spacer
                // Description (with maximum 2 lines and ellipsis if overflow)
                Text(
                  widget.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 8), // Spacer
                // Cuisine type
                const Center(
                  child: Text(
                    'Chinese - American - Desi Food',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(height: 15), // Spacer
                // Choice of Top Cookie
                 Text(
                  AppLocalizations.of(context)!.choiceoftopcookie,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 12), // Spacer
                // Button to show top cookie options
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Calculate the position for the popup menu
                      final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
                      final double screenWidth = overlay.size.width;
                      final double screenHeight = overlay.size.height;

                      const double menuWidth = 200; // Adjust this width as needed
                      final double menuHeight = widget.options.length * 56.0; // Assuming each item is 56.0 in height

                      final double menuX = (screenWidth - menuWidth) / 2;
                      final double menuY = (screenHeight - menuHeight) / 2;

                      final RelativeRect position = RelativeRect.fromLTRB(
                        menuX,
                        menuY,
                        menuX + menuWidth,
                        menuY + menuHeight,
                      );

                      // Open the popup menu for top cookie options here
                      showMenu(
                        context: context,
                        position: position,
                        items: List.generate(
                          widget.options.length,
                              (index) {
                            return PopupMenuItem<int>(
                              value: index,
                              child: RadioListTile<int>(
                                title: Text(widget.options[index]),
                                value: index,
                                groupValue: selectedOptionIndex,
                                onChanged: (value) {
                                  Navigator.of(context).pop(); // Close the menu
                                  setState(() {
                                    selectedOptionIndex = value!;
                                  });
                                },
                              ),
                            );
                          },
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                    ),
                    child:  Text(AppLocalizations.of(context)!.showtopcookies),
                  ),
                ),
                const SizedBox(height: 12), // Spacer
                // Choice of flavor
                 Text(
                  AppLocalizations.of(context)!.choiceofflavour,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 12), // Spacer
                // Button to select flavor
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Calculate the position for the popup menu
                      final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
                      final double screenWidth = overlay.size.width;
                      final double screenHeight = overlay.size.height;

                      const double menuWidth = 200; // Adjust this width as needed
                      final double menuHeight = widget.flavors.length * 56.0; // Assuming each item is 56.0 in height

                      final double menuX = (screenWidth - menuWidth) / 2;
                      final double menuY = (screenHeight - menuHeight) / 2;

                      final RelativeRect position = RelativeRect.fromLTRB(
                        menuX,
                        menuY,
                        menuX + menuWidth,
                        menuY + menuHeight,
                      );

                      // Open the popup menu for flavor options here
                      showMenu(
                        context: context,
                        position: position,
                        items: List.generate(
                          widget.flavors.length,
                              (index) {
                            return PopupMenuItem<int>(
                              value: index,
                              child: RadioListTile<int>(
                                title: Text(widget.flavors[index]),
                                value: index,
                                groupValue: selectedFlavorIndex,
                                onChanged: (value) {
                                  Navigator.of(context).pop(); // Close the menu
                                  setState(() {
                                    selectedFlavorIndex = value!;
                                  });
                                },
                              ),
                            );
                          },
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                    ),
                    child: const Text("Select Flavor"),
                  ),
                ),
                const SizedBox(height: 10), // Spacer
                // Choice of Ads On
                 Text(
                  AppLocalizations.of(context)!.choiceofadon,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 12), // Spacer
                // Button to select Ads On
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Calculate the position for the popup menu
                      final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
                      final double screenWidth = overlay.size.width;
                      final double screenHeight = overlay.size.height;

                      const double menuWidth = 200; // Adjust this width as needed
                      final double menuHeight = widget.AdsOn.length * 56.0; // Assuming each item is 56.0 in height

                      final double menuX = (screenWidth - menuWidth) / 2;
                      final double menuY = (screenHeight - menuHeight) / 2;

                      final RelativeRect position = RelativeRect.fromLTRB(
                        menuX,
                        menuY,
                        menuX + menuWidth,
                        menuY + menuHeight,
                      );

                      // Open the popup menu for Ads On options here
                      showMenu(
                        context: context,
                        position: position,
                        items: List.generate(
                          widget.AdsOn.length,
                              (index) {
                            return PopupMenuItem<int>(
                              value: index,
                              child: RadioListTile<int>(
                                title: Text(widget.AdsOn[index]),
                                value: index,
                                groupValue: selectedAdsOnIndex,
                                onChanged: (value) {
                                  Navigator.of(context).pop(); // Close the menu
                                  setState(() {
                                    selectedAdsOnIndex = value!;
                                  });
                                },
                              ),
                            );
                          },
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                    ),
                    child:  Text(AppLocalizations.of(context)!.selectadons),
                  ),
                ),
                const SizedBox(height: 40),
                CustomButton2
                  (text: AppLocalizations.of(context)!.addtoorder,
                    onPressed: ()
                    
                    {
                      RestaurantModel restaurant = RestaurantModel(
                        rest_Cat: null
  // initialize the properties with the required values
);
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>  MenuPage(restaurant: restaurant,)));
                    })
              ],
            ),
          ),
        ],
      ),
    );
  }
}