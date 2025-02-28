import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:quick_mart/consts/app_colors.dart';
import 'package:quick_mart/screens/cart_page/my_cart_page.dart';
import 'package:quick_mart/screens/categories_page/categories_page.dart';
import 'package:quick_mart/screens/home_page/home_page.dart';
import 'package:quick_mart/screens/main_page/main_page_vm.dart';
import 'package:quick_mart/screens/profiles_page/profile_page.dart';
import 'package:quick_mart/screens/wishlists_page/wishlists_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late MainPageVm mainPageVm;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    mainPageVm = Provider.of<MainPageVm>(context);
    super.didChangeDependencies();
  }

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
                ProfilePage(),
              ],
              scrollDirection: Axis.horizontal,
              physics: NeverScrollableScrollPhysics(),
              controller: mainPageVm.pageCtrl,
              onPageChanged: (value) {
                mainPageVm.index = value;
              },
            ),
          ),
          Container(
            width: double.infinity,
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
              children: List.generate(5, (index) {
                return buildItem(index);
              }).toList(),
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
          if (mainPageVm.index != i) {
            mainPageVm.setIndex(i);
            mainPageVm.pageCtrl.jumpToPage(i);
          }
        },
        child: Container(
          color: AppColors.white,
          height: 80,
          padding: EdgeInsets.only(bottom: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                mainPageVm.index == i ? listIconActive[i] : listIcon[i],
                width: 24,
                height: 24,
              ),
              Text(
                listTitle[i],
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: mainPageVm.index == i ? AppColors.cBlack_50 : AppColors.cGray,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
