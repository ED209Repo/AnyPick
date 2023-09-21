class browseItem {
  final String title;
  final String imageUrl;
  final String Description;
  final String time;
  browseItem({
    required this.title,
    required this.imageUrl,
    required this.Description,
    required this.time,
  });
}
class BrowseItemModel {
  static List<browseItem> items = [
    browseItem(
      title: 'McDonalds',
      imageUrl: 'images/mcdd.jpg',
      Description: 'Fast Food',
      time: '25 min',
    ),
    browseItem(
      title: 'KFC',
      imageUrl: 'images/kfc logo.png',
      Description: 'Fast Food',
      time: '30 min',
    ),
    browseItem(
      title: 'Hardees',
      imageUrl: 'images/hardess logo.png',
      Description: 'Fast Food',
      time: '20 min',
    ),
    browseItem(
      title: 'Gloria Jeans',
      imageUrl: 'images/Gloria jeans.png',
      Description: 'Cafe',
      time: '16 min',
    ),
  ];
}
