import 'package:anypickdemo/AccountSettings.dart';
import 'package:anypickdemo/bottomCart.dart';
import 'package:anypickdemo/browseScreen.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Card_Swiper.dart';
import 'MenuPage.dart';
import 'Register.dart';
import 'Widgets/AppColors.dart';
import 'card_candidate_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Example extends StatefulWidget {
  const Example({Key? key}) : super(key: key);

  @override
  State<Example> createState() => _ExamplePageState();
}

class _ExamplePageState extends State<Example> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final String profileImageUrl =
      ''; // Replace with your image URL
   String userName = 'Danial'; // Replace with the user's name
  bool isLoggedIn = false ;
  final CardSwiperController controller = CardSwiperController();
  final cards = candidates.map(ExampleCard.new).toList();


  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
Future<String> _getUsername()async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String uname = prefs.getString('username') ?? "Guest";
  if (uname != 'Guest'){
    isLoggedIn = true ;
  }
  return uname;
}

  @override
  Widget build(BuildContext context) {
    final currentTime = DateTime.now();
    final currentHour = currentTime.hour;
    String message = "";
    if (currentHour >= 0 && currentHour < 12) {
      message = AppLocalizations.of(context)!.goodmorning;
    } else {
      message = AppLocalizations.of(context)!.goodevening;
    }

    return Scaffold(
        body: Container(
            child: SafeArea(
                child: Column(children: [
                   Row(
                      children: [
                          Padding(
                                padding: const EdgeInsets.only(left: 10, top: 10),
                                   child: GestureDetector(
                                      onTap: () {
                                        
                                        if(isLoggedIn) {
                                         Navigator.of(context).push(
                                      MaterialPageRoute(
                                     builder: (context) => const AccountSettingsPage(),
                  ),
                );
                               }else {
                                 CoolAlert.show(context: context, type: CoolAlertType.loading,
                              text: AppLocalizations.of(context)!.signUpFirstToAccessApplicationFeatures,
                              animType: CoolAlertAnimType.scale,
                              lottieAsset: 'images/warning.json',
                              autoCloseDuration: Duration(seconds: 3)
                               );
                               }
              },
                                       child: const CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: 25, // Adjust the radius as needed
                                       backgroundImage: AssetImage('images/arabmanprofile2.png'
                                      ),
              ),
            ),
          ),
                                        const SizedBox(width: 10),
                                            Column(

                                                 crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [

                                                 Text(
                                                  message,
                                               style: const TextStyle(
                                               color: Colors.black,
                                              fontSize: 14,
                                            ),
                                             ),
                                                  FutureBuilder<String>(
  future: _getUsername(),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return CircularProgressIndicator();
    } else if (snapshot.hasError) {
      return Text('Error: ${snapshot.error}');
    } else {
      return Text('${AppLocalizations.of(context)!.hey} ${snapshot.data}');
    }
  },
),
            ],
          ),
          const Spacer(),
          const Spacer(),
          IconButton(
            icon: Icon(
              Icons.search,
              color: AppColors.themeColor2,
              size: 35,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const TryScreen()));
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.location_on,
              color: Colors.red,
              size: 35,
            ),
            onPressed: () {
              // Handle search button press
            },
          ),
        ],
      ),
      Flexible(
        child: CardSwiper(
          controller: controller,
          cardsCount: cards.length,
          onSwipe: _onSwipe,
          onUndo: _onUndo,
          numberOfCardsDisplayed: 2,
          backCardOffset: const Offset(40, 40),
          padding:
              const EdgeInsets.only(top: 10, bottom: 50, left: 15, right: 15),
          cardBuilder: (
            context,
            index,
            horizontalThresholdPercentage,
            verticalThresholdPercentage,
          ) =>
              cards[index],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(10),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: AppColors.themeColor,
            elevation: 3,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15))),
            minimumSize: const Size(350, 50),
          ),
          onPressed: ()  async {
            final preferences = await SharedPreferences.getInstance();
            final String? phoneNumber = preferences.getString('phoneNumber');

            phoneNumber != null ? showModalBottomSheet<dynamic>(
              backgroundColor: Colors.white,
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20))),
              context: context,
              builder: (BuildContext context) {
                return Container(
                  height: MediaQuery.of(context).size.height * 0.7,
                  width: double.infinity,
                  child: const BottomSheetCart(),
                );
              },
            ) : showModalBottomSheet<dynamic>(
              backgroundColor: Colors.white,
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20))),
              context: context,
              builder: (BuildContext context) {
                return Container(
                  height: MediaQuery.of(context).size.height * 0.7,
                  width: double.infinity,
                  child: const registerscreen(),
                );
              },
            );

          },
          child: Text(
            AppLocalizations.of(context)!.cart,
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ),
    ]
    ))));
  }

  bool _onSwipe(
    int previousIndex,
    int? currentIndex,
    CardSwiperDirection direction,
  ) {
    direction.name == "top"
        ? //--- true if UP swipe
        Future.delayed(const Duration(milliseconds: 1000), () {
            setState(() {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MenuPage(),
                ),
              );
            });
          })
        : debugPrint(
            'The card $previousIndex was swiped to the ${direction.name}. Now the card $currentIndex is on top',
          );
    return true;
  }

  bool _onUndo(
    int? previousIndex,
    int currentIndex,
    CardSwiperDirection direction,
  ) {
    debugPrint(
      'The card $currentIndex was undid from the ${direction.name}',
    );
    return true;
  }
}