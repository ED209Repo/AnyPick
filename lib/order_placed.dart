import 'package:anypickdemo/homeScreen.dart';
import 'package:flutter/material.dart';
import 'Widgets/AppColors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class OrderPlacedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20), // Adjust the padding as needed
            child: Container(
              width: 700,
              height: 250,
              decoration: BoxDecoration(
                color: AppColors.themeColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Stack(
                alignment: Alignment.topCenter, // Align the icon at the top center
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 30), // Adjust the top spacing as needed
                      Text(
                        AppLocalizations.of(context)!.orderplaced,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.themeColor, // Use your preferred color
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16), // Add horizontal padding
                        child: Text(
                          AppLocalizations.of(context)!.orderplaced2,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black, // Use your preferred color
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  Transform.translate(
                    offset: Offset(0, -40), // Adjust the vertical offset as needed
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green, // Use your preferred color
                      ),
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 35),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16), // Adjust the horizontal padding as needed
              child: Container(
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Example(),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(AppColors.themeColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                    ),
                    minimumSize: MaterialStateProperty.all<Size>(
                      Size(double.infinity, 5), // Use double.infinity for full width
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                       AppLocalizations.of(context)!.gotohome,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 10),
                      Icon(
                        Icons.home,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}