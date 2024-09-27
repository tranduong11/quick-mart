import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quick_mart/consts/app_colors.dart';
import 'package:quick_mart/consts/app_dimensions.dart';
import 'package:quick_mart/consts/app_paths.dart';
import 'package:quick_mart/models/entity/firebase_entity/categories_entity.dart';
import 'package:quick_mart/models/entity/products_object.dart';
import 'package:quick_mart/screens/home_page/widgets/search_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {
  int indicator = 0;

  List<CategoriesEntity> listCategories = [
    CategoriesEntity(images: AppPath.ic_home_one, title: 'Electronics'),
    CategoriesEntity(images: AppPath.ic_home1, title: 'Fashion'),
    CategoriesEntity(images: AppPath.ic_home3, title: 'Furniture'),
    CategoriesEntity(images: AppPath.ic_home4, title: 'Industrial'),
    CategoriesEntity(images: AppPath.ic_home_one, title: 'Electronics'),
    CategoriesEntity(images: AppPath.ic_home_one, title: 'Electronics'),
    CategoriesEntity(images: AppPath.ic_home_one, title: 'Electronics'),
    CategoriesEntity(images: AppPath.ic_home_one, title: 'Electronics'),
    CategoriesEntity(images: AppPath.ic_home_one, title: 'Electronics'),
  ];

  List<ProductsHome> listProductsHome = [
    ProductsHome(
      images: AppPath.img_item1,
      subimages: AppPath.ic_color,
      title: 'Nike air jordan retro fas',
      price: '\$126.00',
      subsprice: '\$186.00',
      allcolor: 'All 5 Colors',
    ),
    ProductsHome(
      images: AppPath.img_item2,
      subimages: AppPath.ic_color,
      title: 'Nike air jordan retro fas',
      price: '\$126.00',
      subsprice: '\$186.00',
      allcolor: 'All 5 Colors',
    ),
    ProductsHome(
      images: AppPath.img_item3,
      subimages: AppPath.ic_color,
      title: 'Nike air jordan retro fas',
      price: '\$126.00',
      subsprice: '\$186.00',
      allcolor: 'All 5 Colors',
    ),
    ProductsHome(
      images: AppPath.img_item4,
      subimages: AppPath.ic_color,
      title: 'Nike air jordan retro fas',
      price: '\$126.00',
      subsprice: '\$186.00',
      allcolor: 'All 5 Colors',
    ),
    ProductsHome(
      images: AppPath.img_item1,
      subimages: AppPath.ic_color,
      title: 'Nike air jordan retro fas',
      price: '\$126.00',
      subsprice: '\$186.00',
      allcolor: 'All 5 Colors',
    ),
    ProductsHome(
      images: AppPath.img_item1,
      subimages: AppPath.ic_color,
      title: 'Nike air jordan retro fas',
      price: '\$126.00',
      subsprice: '\$186.00',
      allcolor: 'All 5 Colors',
    ),
  ];

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
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SearchWidget();
                  },
                ),
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

  Expanded buildBody() {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 12),
            Container(
              height: 163,
              margin: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
              ),
              child: Stack(
                children: [
                  Positioned(
                    child: PageView(
                      pageSnapping: true,
                      padEnds: false,
                      allowImplicitScrolling: false,
                      physics: BouncingScrollPhysics(),
                      onPageChanged: (index) {
                        setState(() {
                          indicator = index;
                        });
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

  Widget buildItemGridview(int index, ProductsHome item) {
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
                  decoration: BoxDecoration(
                    color: AppColors.cBlack_50,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: SvgPicture.asset(AppPath.ic_heart_home),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Container(
                width: 60,
                child: Stack(
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: AppColors.cBlack_50,
                        borderRadius: BorderRadius.circular(30),
                        border: Border(
                          top: buildBorderSide(2.5, AppColors.cBlue),
                          bottom: buildBorderSide(2.5, AppColors.cBlue),
                          right: buildBorderSide(2.5, AppColors.cBlue),
                          left: buildBorderSide(2.5, AppColors.cBlue),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 18,
                      child: Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          color: AppColors.cGreen_50,
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 36,
                      child: Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          color: AppColors.cYanPrimary,
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 8),
              Text(
                item.allcolor ?? '',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: 10,
                  fontWeight: FontWeight.w300,
                  color: AppColors.cBlack_50,
                ),
              ),
              Spacer(),
            ],
          ),
          Text(
            item.title ?? '',
            style: TextStyle(
              color: AppColors.cBlack_50,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            item.price ?? '',
            style: TextStyle(
              color: AppColors.cBlack_50,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  BorderSide buildBorderSide(double width, Color color) {
    return BorderSide(
      width: width,
      color: color,
    );
  }

  Widget buildRowTitle(String title, String subTitle) {
    return Row(
      children: [
        SizedBox(width: 16),
        Text(
          '$title',
          style: TextStyle(
            color: Color(0xFF1C1B1B),
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
        ),
        Spacer(),
        Text(
          '$subTitle',
          style: TextStyle(
            color: AppColors.cYanPrimary,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(width: 16),
      ],
    );
  }

  Widget buildItemListView(int index, CategoriesEntity itemCount) {
    return Container(
      width: 76,
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
          Image.asset(
            itemCount.images ?? '',
            width: 60,
            height: 29,
          ),
          SizedBox(height: 2),
          Container(
            width: getWidth(context),
            height: 13,
            margin: EdgeInsets.only(bottom: 2),
            child: Center(
              child: Text(
                '${itemCount.title}',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
              ),
            ),
          ),
        ],
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
                  decoration: BoxDecoration(
                    color: AppColors.cBlack,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      '$percent',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 10,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
                Text(
                  '$subtitle',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.normal,
                    color: AppColors.white,
                  ),
                ),
                Text(
                  '$title',
                  style: TextStyle(
                    fontSize: 24,
                    color: AppColors.white,
                    fontWeight: FontWeight.w700,
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
        color: indicator == itemIndex ? AppColors.cYanPrimary : AppColors.cGray_100,
        shape: BoxShape.circle,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
