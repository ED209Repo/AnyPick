class menuData {
  final String imageUrl;
  menuData({required this.imageUrl});
}
class ImageList {
  static List<menuData> images = [
    menuData(imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOCI8xI5nHfifMlfOIKunvKXEuR7aJQDyOZQ&usqp=CAU'),
    menuData(imageUrl: 'https://i.ibb.co/WsB2tDb/Screenshot-2023-08-21-at-11-30-10-PM.png'),
    // Add more image URLs as needed
  ];
}
