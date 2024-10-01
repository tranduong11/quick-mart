import 'package:flutter/material.dart';
import 'package:quick_mart/consts/app_routes.dart';
import 'package:quick_mart/data_local/shared_pref.dart';

class SplashVm extends ChangeNotifier {
  void checkNavigate(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () async {
      bool? checkHasUser = await SharedPref.instance.getBool('check');
      if (checkHasUser == true) {
        Navigator.pushReplacementNamed(context, AppRoute.login);
      } else {
        Navigator.pushReplacementNamed(context, AppRoute.onBoarding);
      }
    });
  }
}
