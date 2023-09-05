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
      title: 'Item 1',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRldj56-OSaTw-EYr1aJBAkKXeF2s_XXbVbUA&usqp=CAU',
      dishType: 'Dessert', // Replace with actual dish type

    ),
    MenuItem(
      title: 'Item 2',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRldj56-OSaTw-EYr1aJBAkKXeF2s_XXbVbUA&usqp=CAU',
      dishType: 'Dessert', // Replace with actual dish type

    ),
    MenuItem(
      title: 'Item 3',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ-gS-GT2kGRuYfS8SOTdpwGpNE9JdzZt2mbA&usqp=CAU',
      dishType: 'Dessert', // Replace with actual dish type

    ),
    MenuItem(
      title: 'Item 4',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJeWVOiCuEGP_lX_3RLXbOfr8FDT8EIORkYQ&usqp=CAU',
      dishType: 'Dessert', // Replace with actual dish type

    ),
    // Add more menu items here
  ];
}