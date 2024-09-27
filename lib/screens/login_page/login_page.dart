import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quick_mart/consts/app_colors.dart';
import 'package:quick_mart/consts/app_paths.dart';
import 'package:quick_mart/consts/app_routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController ctr_email = TextEditingController(text: "a@gmail.com");
  TextEditingController ctr_password = TextEditingController(text: "1234567");
  bool password = true;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
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
                'Login',
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
                      Navigator.pushReplacementNamed(
                        context,
                        AppRoute.signUpOne,
                      );
                    },
                    child: Text(
                      'Signup',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: AppColors.cYanPrimary,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              buildRichText('Email ', '*'),
              SizedBox(height: 8),
              TextField(
                textInputAction: TextInputAction.continueAction,
                controller: ctr_email,
                decoration: InputDecoration(
                  enabledBorder: buildOutlineInputBorder(),
                  focusedBorder: buildOutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              buildRichText('Password ', '*'),
              SizedBox(height: 8),
              TextField(
                obscureText: password,
                controller: ctr_password,
                onChanged: (pass) {
                  setState(() {
                    pass = ctr_password.text;
                  });
                },
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
                  focusedBorder: buildOutlineInputBorder(),
                ),
              ),
              SizedBox(height: 24),
              Container(
                height: 60,
                child: GestureDetector(
                  onTap: () {
                    if (isLoading != true) {
                      signInApp(ctr_email.text, ctr_password.text, ctr_email.text.toString());
                    }
                  },
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.cBlack_50,
                    ),
                    child: Center(
                      child: isLoading == true
                          ? SizedBox(
                              height: 24,
                              width: 24,
                              child: CircularProgressIndicator(),
                            )
                          : Text(
                              'Login',
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
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) {
                    //       return GetOtpEmail();
                    //     },
                    //   ),
                    // );
                  },
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
                            'Login with Google',
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

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(
        width: 1,
        color: AppColors.cYanPrimary,
      ),
      borderRadius: BorderRadius.circular(12),
    );
  }

  Future<void> signInApp(String email, String password, String check) async {
    try {
      setState(() {
        isLoading = true;
      });
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("User signed in: ${userCredential.user}");
      if (userCredential.user?.email == check) {
        Navigator.pushReplacementNamed(context, AppRoute.mainPage);
      } else {
        print('Lỗi đăng nhập!!!');
      }
      setState(() {
        isLoading = false;
      });
    } on FirebaseAuthException catch (e) {
      setState(() {
        isLoading = false;
      });
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided.');
      }
    }
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
