import 'package:flutter/cupertino.dart';
import 'package:quick_mart/consts/app_colors.dart';

class AppDecoration {
  static BoxDecoration radiusSmall = BoxDecoration(
    color: AppColors.cBlue,
    borderRadius: BorderRadius.circular(8),
  );
  static BoxDecoration radiusMedium = BoxDecoration(
    color: AppColors.cBlue,
    borderRadius: BorderRadius.circular(12),
  );
  static BoxDecoration radiusBig = BoxDecoration(
    borderRadius: BorderRadius.circular(24),
  );
  static BoxDecoration radiusBiggest = BoxDecoration(
    color: AppColors.cBlack_50,
    borderRadius: BorderRadius.circular(30),
  );

  static BoxDecoration radiusTopSmall = BoxDecoration(
    color: AppColors.cBlue,
    borderRadius: BorderRadius.vertical(
      top: Radius.circular(8),
    ),
  );
  static BoxDecoration radiusTopMedium = BoxDecoration(
    color: AppColors.cBlue,
    borderRadius: BorderRadius.vertical(
      top: Radius.circular(12),
    ),
  );
  static BoxDecoration radiusTopBig = BoxDecoration(
    color: AppColors.white,
    borderRadius: BorderRadius.vertical(
      top: Radius.circular(24),
    ),
  );
  static BoxDecoration radiusTopBiggest = BoxDecoration(
    color: AppColors.cBlack_50,
    borderRadius: BorderRadius.vertical(
      top: Radius.circular(30),
    ),
  );
}
