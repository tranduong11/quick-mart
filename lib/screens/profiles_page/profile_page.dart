import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:quick_mart/consts/app_colors.dart';
import 'package:quick_mart/consts/app_paths.dart';
import 'package:quick_mart/screens/profiles_page/profile_page_vm.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: false,
        child: Stack(
          children: [
            buildContainer(context),
            Container(
              margin: EdgeInsets.only(top: 110),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(24),
                ),
                color: AppColors.white,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 24),
                    buildRowText('Personal Information'),
                    SizedBox(height: 24),
                    buildRow(
                      AppPath.ic_box,
                      'Shipping Address',
                      AppPath.ic_chevron,
                    ),
                    buildDivider(),
                    buildRow(
                      AppPath.ic_card,
                      'Payment Method',
                      AppPath.ic_chevron,
                    ),
                    buildDivider(),
                    buildRow(
                      AppPath.ic_receipt,
                      'Order History',
                      AppPath.ic_chevron,
                    ),
                    buildDivider(),
                    SizedBox(height: 24),
                    buildRowText('Support & Information'),
                    SizedBox(height: 24),
                    buildRow(
                      AppPath.ic_shield,
                      'Privacy Policy',
                      AppPath.ic_chevron,
                    ),
                    buildDivider(),
                    buildRow(
                      AppPath.ic_document,
                      'Terms & Conditions',
                      AppPath.ic_chevron,
                    ),
                    buildDivider(),
                    buildRow(
                      AppPath.ic_message,
                      'FAQs',
                      AppPath.ic_chevron,
                    ),
                    buildDivider(),
                    SizedBox(height: 24),
                    buildRowText('Account Management'),
                    SizedBox(height: 24),
                    buildRow(
                      AppPath.ic_lock,
                      'Change Password',
                      AppPath.ic_chevron,
                    ),
                    buildDivider(),
                    Row(
                      children: [
                        SizedBox(width: 16),
                        SvgPicture.asset(
                          AppPath.ic_mobile,
                          width: 24,
                          height: 24,
                        ),
                        SizedBox(width: 12),
                        Text(
                          'Dark Theme',
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.cGray,
                          ),
                        ),
                        Spacer(),
                        SizedBox(
                          height: 35,
                          child: Transform.scale(
                            scaleX: 0.6,
                            scaleY: 0.55,
                            alignment: Alignment.center,
                            child: Switch(
                              value: context.watch<ProfilePageVm>().light,
                              onChanged: (bool value) {
                                context.read<ProfilePageVm>().checkLight(value);
                              },
                              activeTrackColor: AppColors.cYanPrimary,
                              activeColor: AppColors.white,
                              inactiveThumbColor: AppColors.white,
                              inactiveTrackColor: AppColors.cGray,
                            ),
                          ),
                        ),
                        SizedBox(width: 5),
                      ],
                    ),
                    buildDivider(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRowText(String title) {
    return Row(
      children: [
        SizedBox(width: 16),
        Text(
          '$title',
          style: TextStyle(
            fontSize: 14,
            color: AppColors.cBlack_50,
          ),
        ),
      ],
    );
  }

  Widget buildDivider() {
    return Divider(
      color: Colors.grey.shade300,
      thickness: 0.5,
    );
  }

  Widget buildRow(String leading, String title, String action) {
    return Row(
      children: [
        SizedBox(width: 16),
        SvgPicture.asset(
          leading,
          width: 24,
          height: 24,
        ),
        SizedBox(width: 12),
        Text(
          '$title',
          style: TextStyle(
            fontSize: 16,
            color: AppColors.cGray,
          ),
        ),
        Spacer(),
        SvgPicture.asset(action),
        SizedBox(width: 16),
      ],
    );
  }
}
