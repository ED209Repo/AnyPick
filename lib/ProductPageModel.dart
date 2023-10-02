import 'package:flutter/cupertino.dart';

class Food {
  String? imgUrl;
  String? desc;
  String? name;
  String? waitTime;
  num? score;
  num? price;
  num? quantity;
  List<Map<String, String>>? addons;
  String? about;
  bool highLight;

  Food({
    this.imgUrl,
    this.desc,
    this.name,
    this.waitTime,
    this.score,
    this.price,
    this.quantity,
    this.addons,
    this.about,
    this.highLight = false,
  });
  static List<Food> generateRecommendFoods() {
    return [
      Food(
        imgUrl: 'images/hardess.jpg',
        desc: 'Most Popular',
        name: 'Beef Burger',
        waitTime: '40min',
        score: 4.8,
        price: 12,
        quantity: 1,
        addons: [
          {'Serving size': 'images/size2.png'},
          {'Drink': 'images/drink2.png'},
          {'Fries': 'images/fries1.png'},
          {'Sauces': 'images/sauce.png'},
        ],
        //about:
        //'Two chargrilled 100% all-beef patties, topped with two slices of melted American cheese, covered in unique Special sauce, mayo, dill pickles, fresh tomatoes, onions and crunchy lettuce, all in our special toasted Hardees bun.',
        highLight: false,
      ),
      Food(
        imgUrl: 'images/breakfast.png',
        desc: 'Most Popular',
        name: 'Beef Burger',
        waitTime: '40min',
        score: 4.8,
        price: 12,
        quantity: 1,
        addons: [
          {'Serving size': 'images/size2.png'},
          {'Drink': 'images/drink2.png'},
          {'Fries': 'images/fries1.png'},
          {'Sauces': 'images/sauce.png'},
        ],
        //about:
        //'Two chargrilled 100% all-beef patties, topped with two slices of melted American cheese, covered in unique Special sauce, mayo, dill pickles, fresh tomatoes, onions and crunchy lettuce, all in our special toasted Hardees bun.',
        highLight: false,
      ),
      Food(
        imgUrl: 'images/hardess.jpg',
        desc: 'Most Popular',
        name: 'Beef Burger',
        waitTime: '40min',
        score: 4.8,
        price: 12,
        quantity: 1,
        addons: [
          {'Serving size': 'images/size2.png'},
          {'Drink': 'images/drink2.png'},
          {'Fries': 'images/fries1.png'},
          {'Sauces': 'images/sauce.png'},
        ],
        //about:
        //'Two chargrilled 100% all-beef patties, topped with two slices of melted American cheese, covered in unique Special sauce, mayo, dill pickles, fresh tomatoes, onions and crunchy lettuce, all in our special toasted Hardees bun.',
        highLight: false,
      ),
      Food(
        imgUrl: 'images/hardess.jpg',
        desc: 'Most Popular',
        name: 'Beef Burger',
        waitTime: '40min',
        score: 4.8,
        price: 12,
        quantity: 1,
        addons: [
          {'Serving size': 'images/size2.png'},
          {'Drink': 'images/drink2.png'},
          {'Fries': 'images/fries1.png'},
          {'Sauces': 'images/sauce.png'},
        ],
        //about:
        //'Two chargrilled 100% all-beef patties, topped with two slices of melted American cheese, covered in unique Special sauce, mayo, dill pickles, fresh tomatoes, onions and crunchy lettuce, all in our special toasted Hardees bun.',
        highLight: false,
      ),

    ];
  }
}
const Color kPrimaryColor = Color(0xFFF5A896);
const Color kBackground = Color(0xBAF5F5F5);