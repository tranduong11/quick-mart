import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:quick_mart/consts/app_colors.dart';
import 'package:quick_mart/consts/app_decoration.dart';
import 'package:quick_mart/consts/app_paths.dart';
import 'package:quick_mart/consts/app_routes.dart';
import 'package:quick_mart/consts/app_text_style.dart';

import 'home_page_vm.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            buildAppBar(),
            buildBody(),
          ],
        ),
      ),
    );
  }

  Widget buildAppBar() {
    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          SizedBox(width: 16),
          SvgPicture.asset(AppPath.ic_home),
          Text(
            'uickMart',
            style: AppTextStyle.textBig,
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                AppRoute.searchWidget,
              );
            },
            child: SvgPicture.asset(
              AppPath.ic_search_home,
              width: 32,
              height: 32,
            ),
          ),
          SizedBox(width: 12),
          Image.asset(
            AppPath.img_action_home,
            width: 32,
            height: 32,
          ),
          SizedBox(width: 16),
        ],
      ),
    );
  }

  Widget buildBody() {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 12),
            Container(
              height: 163,
              margin: EdgeInsets.symmetric(horizontal: 16),
              decoration: AppDecoration.radiusBig,
              child: Stack(
                children: [
                  Positioned(
                    child: PageView(
                      pageSnapping: true,
                      padEnds: false,
                      allowImplicitScrolling: false,
                      physics: BouncingScrollPhysics(),
                      onPageChanged: (index) {
                        context.read<HomePageVm>().inDiCarTor(index);
                      },
                      children: [
                        buildPageBanner(
                          AppPath.img_banner_home,
                          '30% OFF',
                          'On Headphones',
                          'Exclusive Sales',
                        ),
                        buildPageBanner(
                          AppPath.img_banner_home,
                          '30% OFF',
                          'On Headphones',
                          'Exclusive Sales',
                        ),
                        buildPageBanner(
                          AppPath.img_banner_home,
                          '30% OFF',
                          'On Headphones',
                          'Exclusive Sales',
                        ),
                        buildPageBanner(
                          AppPath.img_banner_home,
                          '30% OFF',
                          'On Headphones',
                          'Exclusive Sales',
                        ),
                        buildPageBanner(
                          AppPath.img_banner_home,
                          '30% OFF',
                          'On Headphones',
                          'Exclusive Sales',
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 16,
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(5, (index) {
                          return buildIndicator(index);
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            buildRowTitle('Categories', 'SEE ALL'),
            SizedBox(height: 12),
            Container(
              height: 60,
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: listCategories.length,
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return buildItemListView(index, listCategories[index]);
                },
              ),
            ),
            SizedBox(height: 24),
            buildRowTitle('Latest Products', 'SEE ALL'),
            SizedBox(height: 12),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: listProductsHome.length,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  childAspectRatio: 3 / 4,
                  mainAxisSpacing: 8,
                ),
                itemBuilder: (context, int index) {
                  return buildItemGridview(
                    index,
                    listProductsHome[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildIndicator(itemIndex) {
    return Container(
      width: 6,
      height: 6,
      margin: EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        color: context.watch<HomePageVm>().indicator == itemIndex
            ? AppColors.cYanPrimary
            : AppColors.cGray_100,
        shape: BoxShape.circle,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
