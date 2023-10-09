class ImageData {
  final String imageUrl;
  ImageData({required this.imageUrl});
}
class ImageList {
  static List<ImageData> images = [
    ImageData(imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOCI8xI5nHfifMlfOIKunvKXEuR7aJQDyOZQ&usqp=CAU'),
    ImageData(imageUrl: 'https://i.ibb.co/WsB2tDb/Screenshot-2023-08-21-at-11-30-10-PM.png'),
    // Add more image URLs as needed
  ];
}
class MenuItem {
  final String title;
  final String imageUrl;
  final String dishType;
  MenuItem({
  required this.title,
  required this.imageUrl,
  required this.dishType,
});
}
class MenuPageModel {
  static List<MenuItem> items = [
    MenuItem(
        title: 'Cookies',
        imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRldj56-OSaTw-EYr1aJBAkKXeF2s_XXbVbUA&usqp=CAU',
        dishType: 'Chocolate', // Replace with actual dish type
    ),
    MenuItem(
        title: 'Pizza',
        imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRldj56-OSaTw-EYr1aJBAkKXeF2s_XXbVbUA&usqp=CAU',
        dishType: 'Italian', // Replace with actual dish type
    ),
    MenuItem(
        title: 'Pasta',
        imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ-gS-GT2kGRuYfS8SOTdpwGpNE9JdzZt2mbA&usqp=CAU',
        dishType: 'White Sauce', // Replace with actual dish type
    ),
    MenuItem(
        title: 'Burger',
        imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJeWVOiCuEGP_lX_3RLXbOfr8FDT8EIORkYQ&usqp=CAU',
        dishType: 'Mighty Zinger', // Replace with actual dish type
    ),
    // Add more menu items here
  ];
}
class scrollList {
  final String title;
  final String imageUrl;
  final String dishType;
  final String description;
  final List<String> options;
  final List<String> flavors;
  final List<String> AdsOn;
  int price;
  int quantity;

  scrollList({
  required this.title,
  required this.imageUrl,
  required this.dishType,
  required this.description,
  required this.price,
    required this.options,
    required this.flavors,
    required this.AdsOn,
  this.quantity = 0,
});
}
class scrollListModel {
  static List<scrollList> items = [
    scrollList(
        title: 'Cookie Sandwich',
        imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRldj56-OSaTw-EYr1aJBAkKXeF2s_XXbVbUA&usqp=CAU',
        dishType: 'Dessert', // Replace with actual dish type
        description: 'A bakery is an establishment that produces and sells flour-based food.',
        price: 5,
      options: ['Chocolate Chip', 'Cookies and Cream', 'Funfetti' ,'M and M' , 'Red Velvet' , 'Peanut Butter' , 'Snickerdoodle'],
      flavors: ['Vanilla', 'Chocolate', 'Strawberry'],
      AdsOn: ['Extra Ketchup','Mayo','Extra Topping'],

    ),
    scrollList(
        title: 'Combo Burger',
        imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRldj56-OSaTw-EYr1aJBAkKXeF2s_XXbVbUA&usqp=CAU',
        dishType: 'Dessert', // Replace with actual dish type
        description: 'A bakery is an establishment that produces and sells flour-based food.',
        price: 5,
      options: ['Option 1', 'Option 2', 'Option 3'],
      flavors: ['Vanilla', 'Chocolate', 'Strawberry'],
        AdsOn: ['Extra Ketchup','Mayo','Extra Topping'],
    ),
    scrollList(
        title: 'Combo Sandwich',
        imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRldj56-OSaTw-EYr1aJBAkKXeF2s_XXbVbUA&usqp=CAU',
        dishType: 'Dessert', // Replace with actual dish type
        description: 'A bakery is an establishment that produces and sells flour-based food.',
        price: 5,
      options: ['Option 33333', 'Option 2', 'Option 3'],
      flavors: ['Vanilla', 'Chocolate', 'Strawberry'],
        AdsOn: ['Extra Ketchup','Mayo','Extra Topping'],
    ),
    scrollList(
        title: 'Oyster Dish',
        imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJeWVOiCuEGP_lX_3RLXbOfr8FDT8EIORkYQ&usqp=CAU',
        dishType: 'Dessert', // Replace with actual dish type
        description: 'A bakery is an establishment that produces and sells flour-based food.',
        price: 5,
      options: ['Option 1', 'Option 2', 'Option 3'],
      flavors: ['Vanilla', 'Chocolate', 'Strawberry'],
        AdsOn: ['Extra Ketchup','Mayo','Extra Topping'],
    ),
    // Add more menu items here
  ];
}