import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:quick_mart/consts/app_colors.dart';
import 'package:quick_mart/consts/app_decoration.dart';
import 'package:quick_mart/consts/app_paths.dart';
import 'package:quick_mart/consts/app_routes.dart';
import 'package:quick_mart/consts/app_text_style.dart';
import 'package:quick_mart/screens/login_page/login_page_vm.dart';
import 'package:quick_mart/screens/login_page/widgets/login_widget.dart';
import 'package:quick_mart/widgets/app_text_filed/app_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginVm loginVm;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loginVm = Provider.of<LoginVm>(context);
  }

  @override
  void dispose() {
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
                    style: AppTextStyle.textBig.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              Text('Login', style: AppTextStyle.textBigSS),
              SizedBox(height: 6),
              Row(
                children: [
                  Text(
                    'Already have an account?',
                    style: AppTextStyle.textMedium.copyWith(
                      color: AppColors.cGray,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                        context,
                        AppRoute.signUpOne,
                      );
                    },
                    child: Text(
                      'Signup',
                      style: AppTextStyle.textSmall.copyWith(
                        color: AppColors.cYanPrimary,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              buildRichText('Email ', '*'),
              SizedBox(height: 8),
              AppTextField(
                controller: loginVm.ctrEmail,
                hintText: 'Enter email',
              ),
              SizedBox(height: 16),
              buildRichText('Password ', '*'),
              SizedBox(height: 8),
              Consumer<LoginVm>(
                builder: (BuildContext context, value, Widget? child) {
                  return AppTextField(
                    controller: loginVm.ctrPassword,
                    hintText: 'Enter password',
                    hintPass: value.hintPass,
                    subFixIc: GestureDetector(
                      onTap: () {
                        loginVm.onChangeHinPass();
                      },
                      child: Container(
                        height: 60,
                        width: 55,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                        ),
                        child: Icon(
                          value.hintPass == true
                              ? Icons.visibility_off_outlined
                              : Icons.remove_red_eye_outlined,
                        ),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 24),
              Container(
                height: 60,
                child: GestureDetector(
                  onTap: () {
                    loginVm.signInApp(context: context);
                  },
                  child: Container(
                    height: 60,
                    decoration: AppDecoration.radiusMedium.copyWith(
                      color: AppColors.cBlack_50,
                    ),
                    child: Center(
                      child: loginVm.isLoading == true
                          ? SizedBox(
                              height: 24,
                              width: 24,
                              child: CircularProgressIndicator(),
                            )
                          : Text(
                              'Login',
                              style: AppTextStyle.textMedium.copyWith(
                                color: AppColors.white,
                              ),
                            ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              buildLoginWithGoogle(),
            ],
          ),
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(
        width: 1,
        color: AppColors.cYanPrimary,
      ),
      borderRadius: BorderRadius.circular(12),
    );
  }
}
