import 'package:flutter/cupertino.dart';
import 'package:quick_mart/consts/app_paths.dart';

class MainPageVm extends ChangeNotifier {
  int index = 0;
  PageController pageCtrl = PageController();

  void setIndex(int i) {
    index = i;
    notifyListeners();
  }
}

List<String> listIcon = [
  AppPath.ic_home_page,
  AppPath.ic_category,
  AppPath.ic_cart,
  AppPath.ic_wishlist,
  AppPath.ic_profile,
];

List<String> listTitle = [
  'Home',
  'Categories',
  'My Cart',
  'Wishlist',
  'Profile',
];

List<String> listIconActive = [
  AppPath.ic_home_page_1,
  AppPath.ic_categories,
  AppPath.ic_cart_1,
  AppPath.ic_wishlist_1,
  AppPath.ic_profile_1,
];
