// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:quick_mart/consts/app_paths.dart';
// import 'package:quick_mart/models/entity/main_page.dart';
// import 'package:quick_mart/screens/categories_page/categories_page.dart';
// import 'package:quick_mart/screens/home_page/home_page.dart';
// import 'package:quick_mart/screens/my_cart_page/my_cart_page.dart';
// import 'package:quick_mart/screens/profiles_page/profile_home.dart';
// import 'package:quick_mart/screens/wishlists_page/wishlists_home.dart';
//
// class MainPage extends StatefulWidget {
//   const MainPage({super.key});
//
//   @override
//   State<MainPage> createState() => _MainPageState();
// }
//
// class _MainPageState extends State<MainPage> {
//   List<NavigatorItem> listNavigatorBottom = [
//     NavigatorItem(index: 0, icon: AppPath.ic_home_page, title: 'Home'),
//     NavigatorItem(index: 1, icon: AppPath.ic_category, title: 'Categories'),
//     NavigatorItem(index: 2, icon: AppPath.ic_cart, title: 'My Cart'),
//     NavigatorItem(index: 3, icon: AppPath.ic_wishlist, title: 'Wishlist'),
//     NavigatorItem(index: 4, icon: AppPath.ic_profile, title: 'Profile'),
//   ];
//   List<NavigatorItem?> listIconGreen = [
//     NavigatorItem(index: 0, icon: AppPath.ic_home_page_1, title: 'Home'),
//     NavigatorItem(index: 1, icon: AppPath.ic_categories, title: 'Categories'),
//     NavigatorItem(index: 2, icon: AppPath.ic_cart_1, title: 'My Cart'),
//     NavigatorItem(index: 3, icon: AppPath.ic_wishlist_1, title: 'Wishlist'),
//     NavigatorItem(index: 4, icon: AppPath.ic_profile_1, title: 'Profile'),
//   ];
//
//   PageController _pageController = PageController();
//   int indexSelect = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Expanded(
//             child: PageView(
//               controller: _pageController,
//               onPageChanged: (index) {
//                 setState(() {
//                   indexSelect = index;
//                 });
//               },
//               physics: NeverScrollableScrollPhysics(),
//               allowImplicitScrolling: true,
//               children: [
//                 HomePage(),
//                 CategoriesPage(),
//                 MyCartPage(),
//                 WishlistsHome(),
//                 ProfileHome(),
//               ],
//             ),
//           ),
//           Container(
//             width: double.infinity,
//             decoration: BoxDecoration(
//               color: Color(0xFFFFFFFF),
//               border: Border(
//                 top: BorderSide(
//                   width: 1,
//                   color: Color(0xFFF4F5FD),
//                 ),
//               ),
//             ),
//             child: SafeArea(
//               top: false,
//               bottom: true,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   buildActionBar(listNavigatorBottom[0]),
//                   buildActionBar(listNavigatorBottom[1]),
//                   buildActionBar(listNavigatorBottom[2]),
//                   buildActionBar(listNavigatorBottom[3]),
//                   buildActionBar(listNavigatorBottom[4]),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget buildActionBar(NavigatorItem item) {
//     return GestureDetector(
//       onTap: () {
//         if (indexSelect != item.index) {
//           setState(() {
//             indexSelect = item.index;
//           });
//           _pageController.jumpToPage(indexSelect);
//         }
//       },
//       child: Container(
//         width: 65,
//         height: 50,
//         margin: EdgeInsets.only(top: 10.5),
//         child: Column(
//           children: [
//             SvgPicture.asset(
//               (indexSelect == item.index
//                   ? listIconGreen[item.index]
//                   : listNavigatorBottom[item.index]) as String,
//             ),
//             Text(
//               item.title,
//               style: TextStyle(
//                 fontWeight: FontWeight.w400,
//                 fontSize: 12,
//                 color: indexSelect == item.index ? Color(0xFF1C1B1B) : Color(0xFF6F7384),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
