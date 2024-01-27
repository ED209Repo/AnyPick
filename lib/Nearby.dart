import 'package:anypickdemo/Request_Model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'Card_Swiper.dart';
import 'MenuPage.dart';
import 'card_candidate_model.dart';

class NearByScreen extends StatefulWidget {
  const NearByScreen({Key? key}) : super(key: key);

  @override
  State<NearByScreen> createState() => _NearByScreenState();
}

class _NearByScreenState extends State<NearByScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final CardSwiperController controller = CardSwiperController();
  final cards = candidates.map(ExampleCard.new).toList();



  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
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
        ],
      ),
    );
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
        RestaurantModel restaurant = RestaurantModel(
          rest_Cat: null
  // initialize the properties with the required values
);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>  MenuPage(restaurant: restaurant,),
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
