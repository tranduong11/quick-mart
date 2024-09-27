import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quick_mart/consts/app_paths.dart';
import 'package:quick_mart/consts/app_routes.dart';
import 'package:quick_mart/data_local/shared_pref.dart';

class MySplash extends StatefulWidget {
  const MySplash({super.key});

  @override
  State<MySplash> createState() => _MySplashState();
}

class _MySplashState extends State<MySplash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () async {
      bool? checkHasUser = await SharedPref.instance.getBool('check');
      if (checkHasUser == true) {
        Navigator.pushReplacementNamed(context, AppRoute.login);
      } else {
        Navigator.pushReplacementNamed(context, AppRoute.onBoarding);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppPath.ic_splash),
            SizedBox(width: 4.07),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'uickMart',
                  style: TextStyle(
                    fontSize: 37,
                    color: Color(0xFF1C1B1B),
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  'Asia’s No 1 Ecommerce App',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Color(0xFF1C1B1B),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
