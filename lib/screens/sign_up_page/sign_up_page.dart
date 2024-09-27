import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quick_mart/consts/app_colors.dart';
import 'package:quick_mart/consts/app_paths.dart';
import 'package:quick_mart/consts/app_routes.dart';
import 'package:quick_mart/frebase/firebase_auth/firebase_auth.dart';

import '../otp_email_page/otp_email_page.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool password = true;
  TextEditingController ctr_name = TextEditingController();
  TextEditingController ctr_email = TextEditingController();
  TextEditingController ctr_password = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    ctr_name.dispose();
    ctr_email.dispose();
    ctr_password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset(AppPath.ic_onboard),
                  Text(
                    'uickMart',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              SizedBox(height: 24),
              Text(
                'Signup',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: AppColors.cBlack_50,
                ),
              ),
              SizedBox(height: 6),
              Row(
                children: [
                  Text(
                    'Already have an account?',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: AppColors.cGray,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoute.login, arguments: "duong");
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: AppColors.cYanPrimary,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32),
              buildRichText('Full Name ', '*'),
              SizedBox(height: 8),
              TextField(
                textInputAction: TextInputAction.continueAction,
                controller: ctr_name,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: AppColors.cYanPrimary,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: AppColors.cYanPrimary,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              SizedBox(height: 16),
              buildRichText('Email ', '*'),
              SizedBox(height: 8),
              TextField(
                textInputAction: TextInputAction.continueAction,
                controller: ctr_email,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: AppColors.cYanPrimary,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: AppColors.cYanPrimary,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              SizedBox(height: 16),
              buildRichText('Password ', '*'),
              TextField(
                obscureText: password,
                controller: ctr_password,
                textInputAction: TextInputAction.continueAction,
                decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        password = !password;
                      });
                    },
                    child: Icon(password ? Icons.visibility_off : Icons.visibility),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: AppColors.cGray_50,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: AppColors.cYanPrimary,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              SizedBox(height: 24),
              Container(
                height: 60,
                child: GestureDetector(
                  onTap: () {
                    final String email = ctr_email.text;
                    bool isValidEmail = EmailValidator.validate(email);
                    if (isValidEmail) {
                      AuthLogin.instance.signUp(ctr_email.text, ctr_password.text);
                      //AuthLogin.instance.otpEmail();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return OtpEmailPage();
                          },
                        ),
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Cảnh báo'),
                            content: Text('Email chưa được đăng ký hoặc không đúng định dạng!!!'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('Ok'),
                              )
                            ],
                          );
                        },
                      );
                    }
                  },
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.cBlack_50,
                    ),
                    child: Center(
                      child: Text(
                        'Create Account',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Container(
                height: 60,
                child: GestureDetector(
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
                            'Signup with Google',
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  RichText buildRichText(String title, String icon) {
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
}
