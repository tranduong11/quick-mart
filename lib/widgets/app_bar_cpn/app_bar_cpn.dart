import 'package:flutter/material.dart';
import 'package:quick_mart/consts/app_colors.dart';
import 'package:quick_mart/consts/app_text_style.dart';

class AppBarCpn extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize = const Size.fromHeight(52);
  final String title;
  final bool? centerTitle;
  final double? elevation;
  final double? leadingW;
  final Widget? leading;
  final Widget? actions;
  final VoidCallback? onBack;
  final Color? bgrColor;

  AppBarCpn({
    Key? key,
    required this.title,
    this.leading,
    this.leadingW,
    this.centerTitle = false,
    this.actions,
    this.elevation,
    this.onBack,
    this.bgrColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: bgrColor ?? AppColors.cYanPrimary,
      elevation: elevation ?? 0.15,
      titleSpacing: 0,
      centerTitle: centerTitle,
      leadingWidth: 48,
      leading: leading ??
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 14),
              color: Colors.transparent,
              child: Icon(
                Icons.arrow_back_ios_outlined,
                size: 20,
                color: AppColors.white,
              ),
            ),
          ),
      title: Text(
        title,
        style: AppTextStyle.textMedium.copyWith(
          color: AppColors.white,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
      actions: [
        actions ?? SizedBox(),
      ],
    );
  }
}
