class browseItem {
  final String title;
  final String imageUrl;
  final String Description;
  final String time;
  final String titleArabic;
  browseItem({
    required this.title,
    required this.imageUrl,
    required this.Description,
    required this.time,
    required this.titleArabic,
  });
}
class BrowseItemModel {
  static List<browseItem> items = [
    browseItem(
      title: 'McDonalds',
      imageUrl: 'images/mcdd.jpg',
      Description: 'Fast Food',
      time: '25 min',
        titleArabic:'ماكدونالدز',
    ),
    browseItem(
      title: 'KFC',
      imageUrl: 'images/kfc12.png',
      Description: 'Fast Food',
      time: '30 min',
        titleArabic:'كنتاكي فرايد تشيكن',
    ),
    browseItem(
      title: 'Hardees',
      imageUrl: 'images/hardess logo.png',
      Description: 'Fast Food',
      time: '20 min',
        titleArabic:'هارديز',
    ),
    browseItem(
      title: 'Gloria Jeans',
      imageUrl: 'images/Gloria jeans.png',
      Description: 'Cafe',
      time: '16 min',
        titleArabic:'جلوريا جينز'
    ),
  ];
}
