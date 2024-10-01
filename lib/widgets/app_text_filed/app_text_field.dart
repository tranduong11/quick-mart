import 'package:flutter/material.dart';
import 'package:quick_mart/consts/app_colors.dart';
import 'package:quick_mart/consts/app_text_style.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final Widget? subFixIc;
  final bool? hintPass;
  final Function(String)? onChange;

  AppTextField({
    required this.controller,
    this.hintText,
    this.subFixIc,
    this.hintPass,
    this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      //autofocus: true,
      controller: controller,
      style: AppTextStyle.textMedium,
      autocorrect: false,
      obscureText: hintPass ?? false,
      keyboardType: TextInputType.text,
      cursorColor: AppColors.cYanPrimary,
      onChanged: (text) {
        onChange?.call(text);
      },
      decoration: InputDecoration(
        hintText: hintText ?? 'Enter your input',
        hintStyle: AppTextStyle.textMedium.copyWith(
          color: AppColors.cGray.withOpacity(0.5),
        ),
        contentPadding: subFixIc != null
            ? EdgeInsets.only(left: 16)
            : EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        isDense: true,
        filled: true,
        fillColor: AppColors.bgr,
        enabledBorder: buildOutlineInputBorder(AppColors.cYanPrimary),
        errorBorder: buildOutlineInputBorder(AppColors.cError),
        focusedBorder: buildOutlineInputBorder(
          AppColors.cYanPrimary,
        ),
        suffixIcon: subFixIc,
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder(Color color) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        width: 1,
        color: color,
      ),
      borderRadius: BorderRadius.circular(12),
    );
  }
}
