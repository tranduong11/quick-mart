import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quick_mart/consts/app_colors.dart';
import 'package:quick_mart/consts/app_paths.dart';
import 'package:quick_mart/models/entity/firebase_entity/product_entity.dart';
import 'package:quick_mart/screens/categories_page/product_detail_page/product_detail_page.dart';

class ProductPage extends StatefulWidget {
  final String id;

  const ProductPage({super.key, required this.id});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  List<ProductEntity> listProduct = [];

  fetchData() {
    FirebaseFirestore.instance
        .collection("products")
        .where("idProduct", isEqualTo: widget.id)
        .get()
        .then(
      (querySnapshot) {
        print("Successfully completed");
        for (var docSnapshot in querySnapshot.docs) {
          listProduct.add(ProductEntity.fromJson(docSnapshot));
        }
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        bottom: false,
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(width: 16),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset(AppPath.ic_back),
                ),
                SizedBox(width: 6),
                Text(
                  'Products',
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
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: GridView.builder(
                  itemCount: listProduct.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    childAspectRatio: 1 / 1.07,
                    mainAxisSpacing: 8,
                  ),
                  itemBuilder: (context, int index) {
                    return buildItemGridview(
                      index,
                      listProduct[index],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildItemGridview(int index, ProductEntity item) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return ProductDetailPage(product: listProduct[index]);
            },
          ),
        );
      },
      child: Container(
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 160,
                height: 138,
                padding: EdgeInsets.symmetric(vertical: 2),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image.network(
                    item.images ?? '',
                  ),
                ),
              ),
              SizedBox(height: 8),
              Text(
                item.title ?? '',
                style: TextStyle(
                  color: AppColors.cBlack_50,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
