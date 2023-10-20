class menuData {
  final String imageUrl;
  menuData({required this.imageUrl});
}
class ImageList {
  static List<menuData> images = [
    menuData(imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOCI8xI5nHfifMlfOIKunvKXEuR7aJQDyOZQ&usqp=CAU'),
    // Add more image URLs as needed
  ];
}
