import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTextStyle {
  static TextStyle textExtremelySmall = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.bold,
    height: 16 / 12,
    color: AppColors.white,
  );

  static TextStyle textSmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 16 / 12,
    color: AppColors.cBlack_50,
  );
  static TextStyle textMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 16 / 12,
    color: AppColors.cBlack_50,
  );
  static TextStyle textMediumS = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: 16 / 12,
    color: AppColors.cBlack_50,
  );

  static TextStyle textMediumSS = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    height: 24 / 16,
    color: AppColors.cBlack_50,
  );
  static TextStyle textBig = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    height: 24 / 16,
    color: AppColors.cBlack_50,
  );
  static TextStyle textBigS = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w700,
    height: 24 / 16,
    color: AppColors.cBlack_50,
  );

  static TextStyle textBigSS = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: AppColors.cBlack_50,
  );
}
