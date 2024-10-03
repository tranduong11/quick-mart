import 'package:flutter/material.dart';
import 'package:quick_mart/data_local/shared_pref.dart';
import 'package:quick_mart/routers/app_router_path.dart';

class SplashVm extends ChangeNotifier {
  void checkNavigate(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () async {
      bool? checkHasUser = await SharedPref.instance.getBool('check');
      if (checkHasUser == true) {
        Navigator.pushReplacementNamed(context, AppRoutePath.login);
      } else {
        Navigator.pushReplacementNamed(context, AppRoutePath.onBoarding);
      }
    });
  }
}
