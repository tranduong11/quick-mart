import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quick_mart/consts/app_colors.dart';
import 'package:quick_mart/consts/app_dimensions.dart';
import 'package:quick_mart/consts/app_paths.dart';
import 'package:quick_mart/routers/app_router_path.dart';

class CustomSnackBar {
  static show(BuildContext context) {
    SnackBar snackBar = SnackBar(
      duration: Duration(seconds: 2),
      elevation: 5,
      backgroundColor: AppColors.cGray_50,
      behavior: SnackBarBehavior.floating,
      dismissDirection: DismissDirection.up,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: AppColors.cGray_50,
          width: 1,
        ),
      ),
      margin: EdgeInsets.only(
        bottom: getHeight(context) - 145,
        right: 16,
        left: 16,
      ),
      content: Expanded(
        child: Container(
          width: getWidth(context),
          height: 35,
          child: Row(
            children: [
              SizedBox(
                width: 24,
                height: 24,
                child: SvgPicture.asset(AppPath.ic_success),
              ),
              SizedBox(width: 8),
              SizedBox(
                width: getWidth(context) * 0.55,
                child: Text(
                  'The product has been added to your cart',
                  style: TextStyle(
                    color: AppColors.cBlack_50,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(width: 8),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutePath.myCartPage,
                  );
                },
                child: SizedBox(
                  child: Text(
                    'View Cart',
                    style: TextStyle(
                      color: AppColors.cYanPrimary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
