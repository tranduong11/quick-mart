import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:quick_mart/consts/app_colors.dart';
import 'package:quick_mart/consts/app_paths.dart';
import 'package:quick_mart/consts/app_text_style.dart';
import 'package:quick_mart/frebase/firebase_auth/firebase_auth.dart';
import 'package:quick_mart/routers/app_router_path.dart';
import 'package:quick_mart/screens/otp_email_page/otp_email_page.dart';
import 'package:quick_mart/screens/sign_up_page/sign_up_vm.dart';
import 'package:quick_mart/widgets/app_text_filed/app_text_field.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late SignUpVm signUpVm;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    signUpVm = Provider.of<SignUpVm>(context);
    super.didChangeDependencies();
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
                    style: AppTextStyle.textMedium.copyWith(color: AppColors.cGray),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                        context,
                        AppRoutePath.login,
                        arguments: "duong",
                      );
                    },
                    child: Text(
                      'Login',
                      style: AppTextStyle.textMedium.copyWith(
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
                controller: signUpVm.ctr_name,
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
                controller: signUpVm.ctr_email,
                decoration: InputDecoration(
                  enabledBorder: buildOutlineInputBorder(
                    AppColors.cYanPrimary,
                  ),
                  focusedBorder: buildOutlineInputBorder(
                    AppColors.cYanPrimary,
                  ),
                ),
              ),
              SizedBox(height: 16),
              buildRichText('Password ', '*'),
              AppTextField(
                controller: signUpVm.ctr_password,
                hintText: 'Enter password',
                hintPass: signUpVm.password,
                subFixIc: GestureDetector(
                  onTap: () {
                    signUpVm.checkPassWord();
                  },
                  child: Container(
                    height: 60,
                    width: 55,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: Icon(
                      signUpVm.password == true
                          ? Icons.visibility_off_outlined
                          : Icons.remove_red_eye_outlined,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24),
              Container(
                height: 60,
                child: GestureDetector(
                  onTap: () {
                    final String email = signUpVm.ctr_email.text;
                    bool isValidEmail = EmailValidator.validate(email);
                    if (isValidEmail) {
                      AuthLogin.instance.signUp(
                        signUpVm.ctr_email.text,
                        signUpVm.ctr_password.text,
                      );
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

  OutlineInputBorder buildOutlineInputBorder(Color color) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        width: 1,
        color: color,
        //AppColors.cGray_50,
      ),
      borderRadius: BorderRadius.circular(12),
    );
  }

  Widget buildRichText(String title, String icon) {
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
