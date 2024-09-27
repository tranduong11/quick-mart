import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quick_mart/consts/app_colors.dart';
import 'package:quick_mart/consts/app_paths.dart';
import 'package:quick_mart/screens/categories_page/categories_page.dart';
import 'package:quick_mart/screens/home_page/home_page.dart';
import 'package:quick_mart/screens/my_cart_page/my_cart_page.dart';
import 'package:quick_mart/screens/profiles_page/profile_home.dart';
import 'package:quick_mart/screens/wishlists_page/wishlists_home.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
  }

  int index = 0;
  PageController pageCtrl = PageController();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              children: [
                HomePage(),
                CategoriesPage(),
                MyCartPage(),
                WishlistsHome(),
                ProfileHome(),
              ],
              scrollDirection: Axis.horizontal,
              physics: NeverScrollableScrollPhysics(),
              controller: pageCtrl,
              onPageChanged: (value) {
                setState(() {
                  index = value;
                });
              },
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(bottom: 10.5),
            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border(
                top: BorderSide(
                  width: 1,
                  color: AppColors.cGray_50,
                ),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildItem(0),
                buildItem(1),
                buildItem(2),
                buildItem(3),
                buildItem(4),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildItem(int i) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          if (index != i) {
            setState(() {
              index = i;
            });
            pageCtrl.jumpToPage(i);
          }
        },
        child: Container(
          color: AppColors.white,
          padding: EdgeInsets.symmetric(vertical: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                index == i ? listIconActive[i] : listIcon[i],
                width: 24,
                height: 24,
              ),
              Text(
                listTitle[i],
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: index == i ? AppColors.cBlack_50 : AppColors.cGray,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
