import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quick_mart/consts/app_colors.dart';
import 'package:quick_mart/consts/app_paths.dart';
import 'package:quick_mart/models/entity/firebase_entity/categories_entity.dart';
import 'package:quick_mart/models/entity/products_object.dart';

class HomePageVm extends ChangeNotifier {
  int indicator = 0;

  void inDiCarTor(int i) {
    indicator = i;
    notifyListeners();
  }

  List<CategoriesEntity> listCard = [];
  bool isLoading = false;

  Future<void> fetchData() async {
    try {
      await FirebaseFirestore.instance.collection("categories").get().then((data) {
        data.docs.forEach((result) {
          listCard.add(CategoriesEntity.fromJson(result));
        });
        notifyListeners();
      });
    } catch (e) {
      print('Loi hien thi data!!');
    }
  }
}

BorderSide buildBuildBorderSide() => buildBorderSide(2.5, AppColors.cBlue);

BorderSide buildBorderSide(double width, Color color) {
  return BorderSide(
    width: width,
    color: color,
  );
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
