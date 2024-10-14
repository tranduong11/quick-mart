import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:quick_mart/consts/app_colors.dart';
import 'package:quick_mart/consts/app_paths.dart';
import 'package:quick_mart/consts/app_text_style.dart';
import 'package:quick_mart/models/entity/firebase_entity/categories_entity.dart';
import 'package:quick_mart/screens/categories_page/categories_vm.dart';
import 'package:quick_mart/screens/categories_page/product_page/product_page.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> with AutomaticKeepAliveClientMixin {
  late CateGoRiVm cateGoRiVm;

  @override
  void initState() {
    super.initState();
    cateGoRiVm = context.read<CateGoRiVm>();
    cateGoRiVm.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
                Text('Categories', style: AppTextStyle.textMediumS),
              ],
            ),
            SizedBox(height: 12),
            Divider(
              color: AppColors.cGray_100,
              thickness: 0.5,
            ),
            SizedBox(height: 12),
            Consumer<CateGoRiVm>(
              builder: (BuildContext context, value, Widget? child) {
                return Expanded(
                  child: GridView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    itemCount: value.listCard.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      childAspectRatio: 1 / 0.6,
                      mainAxisSpacing: 8,
                    ),
                    itemBuilder: (context, int index) {
                      return buildItemGridView(index, value.listCard[index]);
                    },
                  ),
                );
              },
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
              return ProductPage(id: cateGoRiVm.listCard[index].idProduct ?? '');
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
        child: Center(
          child: cateGoRiVm.isLoading == true
              ? SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(),
                )
              : Column(
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
