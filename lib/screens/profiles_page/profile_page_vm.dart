import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quick_mart/consts/app_colors.dart';
import 'package:quick_mart/consts/app_paths.dart';
import 'package:quick_mart/frebase/firebase_auth/firebase_auth.dart';
import 'package:quick_mart/screens/login_page/login_page.dart';

class ProfilePageVm extends ChangeNotifier {
  bool light = true;
  void checkLight(bool check) {
    light = check;
    notifyListeners();
  }
}

Widget buildContainer(BuildContext context) {
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
