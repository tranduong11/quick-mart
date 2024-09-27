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
    fontSize: 16,
    fontWeight: FontWeight.bold,
    height: 24 / 16,
    color: AppColors.cYanPrimary,
  );
  static TextStyle textMediums = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    height: 24 / 16,
    color: AppColors.cBlack_50,
  );

  static TextStyle textBig = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    height: 36 / 24,
    color: AppColors.cYanPrimary,
  );
}
