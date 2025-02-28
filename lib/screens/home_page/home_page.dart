import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:quick_mart/consts/app_colors.dart';
import 'package:quick_mart/consts/app_decoration.dart';
import 'package:quick_mart/consts/app_paths.dart';
import 'package:quick_mart/consts/app_text_style.dart';
import 'package:quick_mart/models/entity/firebase_entity/categories_entity.dart';
import 'package:quick_mart/models/entity/products_object.dart';
import 'package:quick_mart/routers/app_router_path.dart';
import 'package:quick_mart/screens/categories_page/product_page/product_page.dart';

import 'home_page_vm.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {
  late HomePageVm homePageVm;

  @override
  void initState() {
    super.initState();
    homePageVm = context.read<HomePageVm>();
    homePageVm.fetchData();
  }

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
                AppRoutePath.searchWidget,
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
                    right: 30,
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
            Consumer<HomePageVm>(builder: (BuildContext context, value, Widget? child) {
              return Container(
                height: 60,
                margin: EdgeInsets.symmetric(horizontal: 5),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: value.listCard.length,
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return buildItemListView(index, value.listCard[index]);
                  },
                ),
              );
            }),
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

  List<Color> listColor = [
    AppColors.cBlack_50,
    AppColors.cGreen_50,
    AppColors.cYanPrimary,
  ];

  Widget buildItemGridview(int index, ProductsHome item) {
    int length = listColor.length;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Positioned(
                child: Image.asset(
                  item.images ?? '',
                ),
              ),
              Positioned(
                right: 6,
                top: 6,
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: AppDecoration.radiusBiggest,
                  child: Center(
                    child: SvgPicture.asset(AppPath.ic_heart_home),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 24 + ((length - 1) * 16),
                height: 24,
                child: Stack(
                  children: List.generate(
                    length,
                    (index) {
                      return Positioned(
                        left: index == (length - 1) ? 0 : ((length - 1) - index) * 16,
                        child: Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            color: listColor[(length - 1) - index],
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(width: 8),
              Text(
                item.allcolor ?? '',
                style: AppTextStyle.textExtremelySmall.copyWith(
                  color: AppColors.cBlack_50,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
          Text(
            item.title ?? '',
            style: AppTextStyle.textMedium,
          ),
          Text(
            item.price ?? '',
            style: AppTextStyle.textSmall.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRowTitle(String title, String subTitle) {
    return Row(
      children: [
        SizedBox(width: 16),
        Text(
          '$title',
          style: AppTextStyle.textBigS,
        ),
        Spacer(),
        Text(
          '$subTitle',
          style: AppTextStyle.textMedium.copyWith(
            color: AppColors.cYanPrimary,
          ),
        ),
        SizedBox(width: 16),
      ],
    );
  }

  Widget buildItemListView(int index, CategoriesEntity itemCount) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return ProductPage(id: homePageVm.listCard[index].idProduct ?? '');
            },
          ),
        );
      },
      child: Container(
        width: 80,
        height: 60,
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border(
            top: buildBorderSide(1, AppColors.cGray_50),
            bottom: buildBorderSide(1, AppColors.cGray_50),
            right: buildBorderSide(1, AppColors.cGray_50),
            left: buildBorderSide(1, AppColors.cGray_50),
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 5),
            Image.network(
              itemCount.images ?? '',
              width: 60,
              height: 29,
            ),
            SizedBox(height: 2),
            Container(
              width: double.infinity,
              height: 13,
              margin: EdgeInsets.only(bottom: 2),
              child: Center(
                child: Text(
                  '${itemCount.title}',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: AppColors.cBlack_50,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPageBanner(String images, String percent, String title, String subtitle) {
    return Container(
      child: Stack(
        children: [
          Image.asset(images),
          Positioned(
            left: 12,
            bottom: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 59,
                  height: 24,
                  padding: EdgeInsets.all(6),
                  decoration: AppDecoration.radiusSmall.copyWith(
                    color: AppColors.cBlack_50,
                  ),
                  child: Center(
                    child: Text(
                      '$percent',
                      style: AppTextStyle.textExtremelySmall.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Text(
                  '$subtitle',
                  style: AppTextStyle.textExtremelySmall.copyWith(
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Text(
                  '$title',
                  style: AppTextStyle.textBigSS.copyWith(
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          )
        ],
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
