import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quick_mart/consts/app_colors.dart';
import 'package:quick_mart/consts/app_paths.dart';
import 'package:quick_mart/models/entity/firebase_entity/categories_entity.dart';
import 'package:quick_mart/screens/categories_page/product_page/product_page.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> with AutomaticKeepAliveClientMixin {
  List<CategoriesEntity> listCard = [];

  Future<void> fetchData() async {
    await FirebaseFirestore.instance.collection("categories").get().then((data) {
      data.docs.forEach((result) {
        listCard.add(CategoriesEntity.fromJson(result));
      });
      setState(() {});
    });
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        top: true,
        bottom: false,
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(width: 16),
                GestureDetector(
                  onTap: () {},
                  child: SvgPicture.asset(AppPath.ic_back),
                ),
                SizedBox(width: 12),
                Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.cBlack_50,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Divider(
              color: AppColors.cGray_100,
              thickness: 0.5,
            ),
            SizedBox(height: 12),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16),
                itemCount: listCard.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  childAspectRatio: 1 / 0.6,
                  mainAxisSpacing: 8,
                ),
                itemBuilder: (context, int index) {
                  return buildItemGridView(index, listCard[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildItemGridView(int index, CategoriesEntity item) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return ProductPage(id: listCard[index].idProduct ?? '');
            },
          ),
        );
      },
      child: Container(
        width: 10,
        height: 20,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.white,
          border: Border(
            top: buildBorderSide(),
            bottom: buildBorderSide(),
            right: buildBorderSide(),
            left: buildBorderSide(),
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 22.5),
            SizedBox(
              width: 136,
              height: 38,
              child: Image.network(item.images ?? ''),
            ),
            SizedBox(height: 2),
            Text(
              '${item.title}',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.cBlack_50,
              ),
            )
          ],
        ),
      ),
    );
  }

  BorderSide buildBorderSide() {
    return BorderSide(
      width: 1,
      color: AppColors.cGray_50,
    );
  }

  @override
  bool get wantKeepAlive => true;
}
