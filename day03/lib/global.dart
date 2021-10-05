class Golbal {
  static dynamic itemData;
  static int pageNum = 1;
  static String rootUrl = 'http://192.168.0.107:3000/';
  static String listUrl = Golbal.rootUrl + 'list/{page}.html/json';
  static String tagListUrl = Golbal.rootUrl + 'tag/json';
  static String typeListUrl = Golbal.rootUrl + 'type/{tagName}/json';
}
