import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quick_mart/consts/app_colors.dart';
import 'package:quick_mart/consts/app_paths.dart';

Widget buildRichText(String title, String icon) {
  return RichText(
    text: TextSpan(
      children: [
        TextSpan(
          text: '$title ',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: AppColors.cBlack_50,
          ),
        ),
        TextSpan(
          text: '$icon',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            color: AppColors.cRed_50,
          ),
        ),
      ],
    ),
  );
}

Widget buildLoginWithGoogle() {
  return GestureDetector(
    onTap: () {},
    child: Container(
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.cGray_50,
        border: Border(
          top: BorderSide(
            color: AppColors.cGray_50,
          ),
        ),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Login with Google',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: AppColors.cBlack_50,
              ),
            ),
            SizedBox(width: 8),
            SvgPicture.asset(AppPath.ic_google),
          ],
        ),
      ),
    ),
  );
}
