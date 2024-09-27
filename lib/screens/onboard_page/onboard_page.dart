import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quick_mart/consts/app_colors.dart';
import 'package:quick_mart/consts/app_dimensions.dart';
import 'package:quick_mart/consts/app_paths.dart';
import 'package:quick_mart/data_local/shared_pref.dart';
import 'package:quick_mart/screens/login_page/login_page.dart';

class OnboardPage extends StatefulWidget {
  const OnboardPage({super.key});

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  int index = 0;
  late PageController pageCtrl;

  @override
  void initState() {
    pageCtrl = PageController();
    super.initState();
  }

  @override
  void dispose() {
    //_pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            pageSnapping: true,
            padEnds: false,
            allowImplicitScrolling: false,
            //physics: NeverScrollableScrollPhysics(),
            controller: pageCtrl,
            onPageChanged: (i) {
              setState(() {
                index = i;
              });
            },
            children: [
              buildOnboard(
                'Explore a wide range of products',
                'Explore a wide range of products at your fingertips.QuickMart offers an extensive \n'
                    'collection to suit your needs.',
              ),
              buildOnboard(
                'Unlock exclusive offers and discounts',
                'Get access to limited-time deals and special\n'
                    ' promotions available only to our valued \n customers.',
              ),
              buildOnboard(
                'Safe and secure \n payments',
                'QuickMart employs industry-leading encryption \n '
                    'and trusted payment gateways to safeguard your\n '
                    ' financial information.',
              ),
            ],
          ),
          Positioned(
            bottom: 124,
            child: Container(
              height: 60,
              child: GestureDetector(
                onTap: () {
                  SharedPref.instance.setBool('check', true);
                  if (index < 2) {
                    setState(() {
                      index++;
                    });
                    pageCtrl.nextPage(
                      duration: Duration(milliseconds: 200),
                      curve: Curves.bounceInOut,
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return LoginPage();
                        },
                      ),
                    );
                  }
                },
                child: Container(
                  height: 60,
                  width: getWidth(context) * 0.9,
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.cBlack_50,
                  ),
                  child: Center(
                    child: Text(
                      getTitleBtn(index),
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
          ),
          Positioned(
            bottom: 100,
            right: getWidth(context) * 0.455,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (i) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: AnimatedContainer(
                    curve: Curves.easeIn,
                    duration: Duration(milliseconds: 450),
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                      color: index == i ? AppColors.cGreen_50 : AppColors.cGray_100,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildOnboard(String title, String subtitle) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: 44),
        buildHeader(
          AppPath.ic_onboard,
          'uickMart',
          'Skip for now',
        ),
        SizedBox(height: 24),
        Text(
          '$title',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: AppColors.cBlack_50,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 16),
        Text(
          '$subtitle',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 24),
        //buildButtonNextPage(),
      ],
    );
  }

  Widget buildHeader(String images, String title, String action) {
    return Container(
      width: getWidth(context) * 0.9,
      height: 408,
      margin: EdgeInsets.only(right: 16, left: 16),
      decoration: BoxDecoration(
        color: AppColors.cYan_50,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 20,
            left: 18,
            child: Row(
              children: [
                index == 0
                    ? SvgPicture.asset(AppPath.ic_onboard)
                    : GestureDetector(
                        onTap: () {
                          if (index > 0) {
                            setState(() {
                              index = index - 1;
                            });
                            pageCtrl.animateToPage(
                              index,
                              duration: Duration(milliseconds: 200),
                              curve: Curves.bounceInOut,
                            );
                          }
                        },
                        child: SvgPicture.asset(AppPath.ic_back),
                      ),
                Text(
                  '${index == 0 ? title : ''}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
          Positioned(
            top: 25.5,
            right: 18,
            child: GestureDetector(
              onTap: () {
                if (index < 2) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginPage();
                      },
                    ),
                  );
                }
              },
              child: Text(
                '${index == 2 ? '' : action}',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: AppColors.cYanPrimary,
                ),
              ),
            ),
          ),
          Positioned(
            left: 44,
            right: 44,
            top: 98,
            child: SizedBox(
              child: Image.asset(AppPath.img_onboard),
            ),
          ),
        ],
      ),
    );
  }

  String getTitleBtn(int i) {
    if (i == 0) {
      return 'Start';
    } else if (i == 1) {
      return 'Next';
    } else {
      return 'Finish';
    }
  }
}
