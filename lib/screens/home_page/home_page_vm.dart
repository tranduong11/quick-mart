import 'package:flutter/material.dart';
import 'package:quick_mart/consts/app_colors.dart';
import 'package:quick_mart/consts/app_decoration.dart';
import 'package:quick_mart/consts/app_paths.dart';
import 'package:quick_mart/consts/app_text_style.dart';
import 'package:quick_mart/models/entity/firebase_entity/categories_entity.dart';
import 'package:quick_mart/models/entity/products_object.dart';

class HomePageVm extends ChangeNotifier {
  int indicator = 0;

  void inDiCarTor(int i) {
    indicator = i;
    notifyListeners();
  }
}

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
          width: double.infinity,
          height: 13,
          margin: EdgeInsets.only(bottom: 2),
          child: Center(
            child: Text(
              '${itemCount.title}',
              style: AppTextStyle.textSmall,
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

BorderSide buildBuildBorderSide() => buildBorderSide(2.5, AppColors.cBlue);

BorderSide buildBorderSide(double width, Color color) {
  return BorderSide(
    width: width,
    color: color,
  );
}
