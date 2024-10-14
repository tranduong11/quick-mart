import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:quick_mart/consts/app_colors.dart';
import 'package:quick_mart/consts/app_decoration.dart';
import 'package:quick_mart/consts/app_paths.dart';
import 'package:quick_mart/consts/app_text_style.dart';
import 'package:quick_mart/data_local/hive_db.dart';
import 'package:quick_mart/models/entity/firebase_entity/product_entity.dart';
import 'package:quick_mart/models/entity/hive_entity/item_cart.dart';
import 'package:quick_mart/screens/categories_page/product_detail_page/product_detail_vm.dart';
import 'package:quick_mart/screens/categories_page/product_detail_page/widgets/snackbar.dart';
import 'package:readmore/readmore.dart';

class ProductDetailPage extends StatefulWidget {
  final ProductEntity product;

  const ProductDetailPage({super.key, required this.product});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  void initState() {
    super.initState();
  }

  late ProductDetailVm productDetailVm;

  @override
  void didChangeDependencies() {
    productDetailVm = Provider.of<ProductDetailVm>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        top: false,
        bottom: true,
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 290,
              child: PageView(
                pageSnapping: true,
                padEnds: false,
                allowImplicitScrolling: false,
                physics: BouncingScrollPhysics(),
                onPageChanged: (value) {
                  productDetailVm.inDi(value);
                },
                children: [
                  buildImage(),
                  buildImage(),
                  buildImage(),
                  buildImage(),
                  buildImage(),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 250, bottom: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 66,
                    height: 16,
                    decoration: AppDecoration.radiusMedium.copyWith(
                      color: AppColors.cGray_50,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: List.generate(5, (index) {
                        return buildIndicator(index);
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 16,
              top: 44,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: SvgPicture.asset(AppPath.ic_back),
              ),
            ),
            Positioned(
              right: 16,
              top: 44,
              child: Container(
                width: 32,
                height: 32,
                decoration: AppDecoration.radiusBiggest,
                child: Center(
                  child: SvgPicture.asset(AppPath.ic_heart_home),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 271),
              width: double.infinity,
              decoration: AppDecoration.radiusTopBig,
              child: Column(
                children: [
                  SizedBox(height: 19),
                  Row(
                    children: [
                      SizedBox(width: 16),
                      Container(
                        width: 62,
                        height: 24,
                        decoration: AppDecoration.radiusSmall,
                        child: Center(
                          child: Text(
                            'Top Rated',
                            style: AppTextStyle.textExtremelySmall,
                          ),
                        ),
                      ),
                      SizedBox(width: 6),
                      Container(
                        width: 81,
                        height: 24,
                        decoration: AppDecoration.radiusSmall.copyWith(
                          color: AppColors.cGreen_50,
                        ),
                        child: Center(
                          child: Text(
                            'Free Shipping',
                            style: AppTextStyle.textExtremelySmall,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 6),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(width: 16),
                      SizedBox(
                        width: 200,
                        child: Text(
                          '${widget.product.title}',
                          style: TextStyle(
                            fontSize: 18,
                            color: AppColors.cBlack_50,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '\$ ${widget.product.price}',
                            style: AppTextStyle.textMediumSS,
                          ),
                        ],
                      ),
                      SizedBox(width: 16),
                    ],
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      SizedBox(width: 16),
                      SvgPicture.asset(AppPath.ic_evaluate),
                      SizedBox(width: 2),
                      Text(
                        '4.5 (2,495 reviews)',
                        style: AppTextStyle.textExtremelySmall.copyWith(
                          color: AppColors.cBlack_50,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ReadMoreText(
                              widget.product.detail.toString(),
                              trimLines: 5,
                              textAlign: TextAlign.justify,
                              trimMode: TrimMode.Line,
                              trimCollapsedText: ' Read more',
                              trimExpandedText: ' Less more',
                              lessStyle: AppTextStyle.textMedium.copyWith(
                                color: AppColors.cYanPrimary,
                              ),
                              moreStyle: AppTextStyle.textMedium.copyWith(
                                color: AppColors.cYanPrimary,
                              ),
                            ),
                            SizedBox(height: 12),
                            Text(
                              'Quantity',
                              style: AppTextStyle.textSmall,
                            ),
                            SizedBox(height: 8),
                            Container(
                              width: 96,
                              height: 32,
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(8),
                                border: buildBorder(),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      productDetailVm.countApart();
                                    },
                                    child: SvgPicture.asset(AppPath.ic_minus),
                                  ),
                                  Text(
                                    '${productDetailVm.count}',
                                    style: AppTextStyle.textMediumS,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      productDetailVm.countAdd();
                                    },
                                    child: SvgPicture.asset(AppPath.ic_add),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 48),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  width: 160,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.circular(12),
                                    border: buildBorder(),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Buy Now',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.cBlack_50,
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    ItemCart itemCart = ItemCart(
                                      images: "${widget.product.images}",
                                      title: "${widget.product.title}",
                                      price: "${widget.product.price}",
                                    );
                                    HiveData.instance.addProject(itemCart);
                                    CustomSnackBar.show(context);
                                  },
                                  child: Container(
                                    width: 160,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: AppColors.cBlack_50,
                                      borderRadius: BorderRadius.circular(12),
                                      border: buildBorder(),
                                    ),
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Add To Cart',
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.white,
                                            ),
                                          ),
                                          SizedBox(width: 8),
                                          SvgPicture.asset(AppPath.ic_shopping),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 12),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Border buildBorder() {
    return Border(
      top: buildBorderSide(),
      bottom: buildBorderSide(),
      right: buildBorderSide(),
      left: buildBorderSide(),
    );
  }

  Widget buildShowBottomSheet() {
    return Container(
      color: Colors.pinkAccent,
      width: double.infinity,
      height: 100,
    );
  }

  Widget buildIndicator(int index) {
    return Container(
      width: 6,
      height: 6,
      decoration: BoxDecoration(
        color: productDetailVm.indicator == index ? AppColors.cYanPrimary : AppColors.cGray_100,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }

  Widget buildImage() {
    return Container(
      padding: EdgeInsets.all(50),
      child: Image.network(
        widget.product.images.toString(),
      ),
    );
  }

  BorderSide buildBorderSide() {
    return BorderSide(
      width: 1,
      color: AppColors.cGray_50,
    );
  }

  TextStyle buildStyleRead() {
    return TextStyle(fontSize: 14, color: AppColors.cYanPrimary);
  }
}
