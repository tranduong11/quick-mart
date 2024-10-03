import 'package:flutter/material.dart';
import 'package:quick_mart/routers/app_router_path.dart';
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

  static AppRouter? _instance;

  static AppRouter get I {
    if (_instance != null) {
      return _instance!;
    } else {
      _instance = AppRouter._();
      return _instance!;
    }
  }

  MaterialPageRoute<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute<dynamic>(
      settings: settings,
      builder: (BuildContext context) {
        return router(
          context: context,
          routeName: settings.name!,
          data: settings.arguments,
        );
      },
    );
  }

  Widget router({required BuildContext context, required String routeName, Object? data}) {
    switch (routeName) {
      case AppRoutePath.splash:
        return MySplash();
      case AppRoutePath.onBoarding:
        return OnboardPage();
      case AppRoutePath.login:
        return LoginPage();
      case AppRoutePath.signUpOne:
        return SignUpPage();
      case AppRoutePath.homePage:
        return HomePage();
      case AppRoutePath.searchWidget:
        return SearchWidget();
      case AppRoutePath.mainPage:
        return MainPage();
      case AppRoutePath.mySubProduct:
        return ProductPage(
          id: '',
        );
      case AppRoutePath.myCartPage:
        return MyCartPage();
      default:
        return SizedBox();
    }
  }
}
