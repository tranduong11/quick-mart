import 'package:flutter/material.dart';
import 'package:quick_mart/consts/app_colors.dart';
import 'package:quick_mart/consts/app_text_style.dart';

Widget textTitleRequire(String title) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(
        title,
        style: AppTextStyle.textMedium.copyWith(
          color: AppColors.cBlack,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      Text(
        ' *',
        style: AppTextStyle.textMedium.copyWith(
          color: AppColors.cError,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    ],
  );
}

Widget textTitle(String title) {
  return Text(
    title,
    style: AppTextStyle.textMedium.copyWith(
      color: AppColors.cBlack,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
  );
}
