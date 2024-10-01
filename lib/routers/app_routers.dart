import 'package:flutter/material.dart';
import 'package:quick_mart/consts/app_routes.dart';
import 'package:quick_mart/screens/categories_page/product_page/product_page.dart';
import 'package:quick_mart/screens/home_page/home_page.dart';
import 'package:quick_mart/screens/home_page/widgets/search_widget.dart';
import 'package:quick_mart/screens/login_page/login_page.dart';
import 'package:quick_mart/screens/main_page/main_page.dart';
import 'package:quick_mart/screens/my_cart_page/my_cart_page.dart';
import 'package:quick_mart/screens/onboard_page/onboard_page.dart';
import 'package:quick_mart/screens/sign_up_page/sign_up_page.dart';
import 'package:quick_mart/screens/splashs_page/splash_page.dart';

class AppRouter {
  AppRouter._();

  static MaterialPageRoute<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute<dynamic>(
      settings: settings,
      builder: (BuildContext context) {
        return router(context: context, routeName: settings.name!, data: settings.arguments);
      },
    );
  }

  static router({required BuildContext context, required String routeName, Object? data}) {
    switch (routeName) {
      case AppRoute.splash:
        return MySplash();
      case AppRoute.onBoarding:
        return OnboardPage();
      case AppRoute.login:
        return LoginPage();
      case AppRoute.signUpOne:
        return SignUpPage();
      case AppRoute.homePage:
        return HomePage();
      case AppRoute.searchWidget:
        return SearchWidget();
      case AppRoute.mainPage:
        return MainPage();
      case AppRoute.mySubProduct:
        return ProductPage(
          id: '',
        );
      // case AppRoute.productDetail:
      //   return ProductDetailPage(product: null,);
      case AppRoute.myCartPage:
        return MyCartPage();
    }
  }
}
