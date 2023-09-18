import 'package:anypickdemo/AccountSettings.dart';
import 'package:anypickdemo/Widgets/CustomButton2.dart';
import 'package:anypickdemo/browseScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'Card_Swiper.dart';
import 'MenuPage.dart';
import 'Widgets/AppColors.dart';
import 'card_candidate_model.dart';
class Example extends StatefulWidget {
  const Example({
    Key? key,
  }) : super(key: key);
  @override
  State<Example> createState() => _ExamplePageState();
}
class _ExamplePageState extends State<Example> {
  final String profileImageUrl =
      'images/profile.jpg'; // Replace with your image URL
  final String userName = 'Danial'; // Replace with the user's name
  final CardSwiperController controller = CardSwiperController();
  final cards = candidates.map(ExampleCard.new).toList();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final currentTime = DateTime.now();
    final currentHour = currentTime.hour;
    String message = "";
    if (currentHour >= 0 && currentHour < 12) {
    message = "Good Morning!";
    } else {
    message = "Good Evening!";
    }
    return Scaffold(
    body: Container(
    child: SafeArea(
    child: Column(
    children: [
    Row(
    children: [
    Padding(
    padding: const EdgeInsets.only(left: 10, top: 10),
    child: GestureDetector(
      onTap: (){
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const AccountSettingsPage(),
          ),
        );
      },
      child: CircleAvatar(
      radius: 25, // Adjust the radius as needed
      backgroundImage: AssetImage('images/profile.jpg'),
      ),
    ),
    ),
    const SizedBox(width: 10),
    Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(
    'Hey  $userName',
    style: const TextStyle(
    color: Colors.black,
    fontSize: 14,
    ),
    ),
    Text(
    message,
    style: const TextStyle(
    color: Colors.black,
    fontSize: 18,
    ),
    ),
    ],),
    const Spacer(),
    const Spacer(),
    IconButton(
    icon: Icon(
    Icons.search,
    color: AppColors.themeColor2,
    size: 35,
    ),
    onPressed: () {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const BrowseScreen()));
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
    numberOfCardsDisplayed: 3,
    backCardOffset: const Offset(40, 40),
    padding: const EdgeInsets.only(top: 5, bottom: 40,left: 15 , right: 15),
    cardBuilder: (
    context,
    index,
    horizontalThresholdPercentage,
    verticalThresholdPercentage,
    ) =>
    cards[index],
    ),
    ),
    CustomButton2(text: "Order", onPressed: (){
    Navigator.push(context, MaterialPageRoute(builder: (context)=> const MenuPage()));
    })
    ],
    ),
    ),
    ),
    );
  }
  bool _onSwipe(
      int previousIndex,
      int? currentIndex,
      CardSwiperDirection direction,
      ) {
    direction.name == "top" ? //--- true if UP swipe
    Future.delayed(const Duration(milliseconds: 1000), () {
      setState(() {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const MenuPage(), // Replace with your MenuPage widget
          ),
        );
        // Here you can write your code for open new view
      });
    }
    ):
    debugPrint(
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