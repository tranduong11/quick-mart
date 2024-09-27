import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quick_mart/consts/app_colors.dart';
import 'package:quick_mart/consts/app_paths.dart';
import 'package:quick_mart/frebase/firebase_auth/firebase_auth.dart';
import 'package:quick_mart/models/entity/profile_object.dart';
import 'package:quick_mart/screens/login_page/login_page.dart';

class ProfileHome extends StatefulWidget {
  const ProfileHome({super.key});

  @override
  State<ProfileHome> createState() => _ProfileHomeState();
}

class _ProfileHomeState extends State<ProfileHome> {
  bool light = true;

  List<ProfileObject> listItemProduct = [
    ProfileObject(
      images: AppPath.ic_box,
      title: 'Shipping Address',
      icon: AppPath.ic_chevron,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: false,
        child: Stack(
          children: [
            buildContainer(),
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
                              value: light,
                              onChanged: (bool value) {
                                setState(() {
                                  light = value;
                                });
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

  Row buildRowText(String title) {
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

  Widget buildContainer() {
    return Container(
      width: double.infinity,
      height: 134,
      color: AppColors.cYanPrimary,
      child: Row(
        children: [
          SizedBox(width: 16),
          Image.asset(
            AppPath.img_action_home,
            width: 40,
            height: 40,
          ),
          SizedBox(width: 8),
          Container(
            height: 40,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ahmed Raza',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: AppColors.white,
                  ),
                ),
                Text(
                  'ahmedraza@gmail.com',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('Logout'),
                    content: Text(
                      'Sau khi đăng xuất tài khoản bạn đã đăng ký vẫn có thể truy cập lại ứng dụng.',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          AuthLogin.instance.signOut();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return LoginPage();
                              },
                            ),
                          );
                        },
                        child: Text('Logout'),
                      )
                    ],
                  );
                },
              );
            },
            child: SvgPicture.asset(AppPath.ic_logout),
          ),
          SizedBox(width: 16),
        ],
      ),
    );
  }
}
