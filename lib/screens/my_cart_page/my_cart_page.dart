import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quick_mart/consts/app_colors.dart';
import 'package:quick_mart/consts/app_dimensions.dart';
import 'package:quick_mart/consts/app_paths.dart';
import 'package:quick_mart/data_local/hive_db.dart';
import 'package:quick_mart/models/entity/hive_entity/item_cart.dart';

class MyCartPage extends StatefulWidget {
  const MyCartPage({super.key});

  @override
  State<MyCartPage> createState() => _MyCartPageState();
}

class _MyCartPageState extends State<MyCartPage> {
  int count = 0;
  double price = 15.25;
  int? indexSelectItem = -1;
  String images1 = '';

  List<int> listIndexSelect = [];
  List<ItemCart> listData = [];

  // reference out box
  // final _myBox = Hive.openBox('tableDataCart');

  @override
  void initState() {
    // _myBox;

    super.initState();
    getData();
  }

  void getData() {
    HiveData.instance.getListCart().then((value) {
      setState(() {
        listData = value ?? [];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Divider(
                  height: 1,
                  color: AppColors.cGray_50,
                ),
                SizedBox(height: 12),
                Container(
                  height: getHeight(context) * 0.57,
                  child: ListView.builder(
                    itemCount: listData.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 120,
                        margin: EdgeInsets.only(bottom: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 120,
                              height: 120,
                              child: Image.network(listData[index].images ?? ''),
                            ),
                            SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 168,
                                  child: Text(
                                    listData[index].title ?? '',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: AppColors.cBlack_50,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  '\$${listData[index].price}',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.cBlack_50,
                                  ),
                                ),
                                SizedBox(height: 23),
                                Container(
                                  width: 96,
                                  height: 32,
                                  decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border(
                                      top: buildBorderSide(),
                                      bottom: buildBorderSide(),
                                      right: buildBorderSide(),
                                      left: buildBorderSide(),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          if (count > 0) {
                                            setState(() {
                                              count--;
                                              price -= 15.25;
                                            });
                                          }
                                        },
                                        child: SvgPicture.asset(AppPath.ic_minus),
                                      ),
                                      Text(
                                        '$count',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: AppColors.cBlack_50,
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          if (count >= 0) {
                                            setState(() {
                                              count++;
                                              price += 15.25;
                                            });
                                          }
                                        },
                                        child: SvgPicture.asset(AppPath.ic_add),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: Checkbox(
                                    checkColor: AppColors.white,
                                    activeColor: AppColors.cYanPrimary,
                                    side: BorderSide(
                                      width: 0.5,
                                      color: AppColors.cBlack,
                                      style: BorderStyle.solid,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                    value: listIndexSelect.contains(index),
                                    onChanged: (checkBox) {
                                      if (listIndexSelect.contains(index) == true) {
                                        listIndexSelect.remove(index);
                                      } else {
                                        listIndexSelect.add(index);
                                      }

                                      setState(() {});
                                    },
                                  ),
                                ),
                                Spacer(),
                                SvgPicture.asset(AppPath.ic_trash),
                              ],
                            ),
                          ],
                        ),
                      );
                      //   ListTile(
                      //   title: Text(helper.title ?? ''),
                      //   subtitle: Text(helper.price ?? ''),
                      // );
                    },
                  ),
                  // Expanded(
                  //   child: ListView.builder(
                  //     itemCount: 5,
                  //     itemBuilder: (context, index) {
                  //       return buildItemListView(index);
                  //     },
                  //   ),
                  // ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: getHeight(context) * 0.53),
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: AppColors.cGray_50,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: getHeight(context) * 0.01),
                Row(
                  children: [
                    Text(
                      'Order Info',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.cBlack_50,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Spacer(),
                  ],
                ),
                SizedBox(height: 20.5),
                buildOderInfo(
                  'Subtotal',
                  12,
                  AppColors.cGray,
                  '27.25',
                  FontWeight.w400,
                ),
                SizedBox(height: 12),
                buildOderInfo(
                  'Shipping Cost',
                  12,
                  AppColors.cGray,
                  '0.00',
                  FontWeight.w400,
                ),
                SizedBox(height: 12),
                buildOderInfo(
                  'Total',
                  16,
                  AppColors.cBlack_50,
                  '27.25',
                  FontWeight.w500,
                ),
                SizedBox(height: 12),
                buildCheckout(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildItemListView(int index) {
    return Container(
      height: 120,
      margin: EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            height: 120,
            child: Image.network(AppPath.img_rectangle_cart),
          ),
          SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 168,
                child: Text(
                  'Loop Silicone Strong Magnetic Watch',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.cBlack_50,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(height: 8),
              Text(
                '\$15.25',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.cBlack_50,
                ),
              ),
              SizedBox(height: 23),
              Container(
                width: 96,
                height: 32,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border(
                    top: buildBorderSide(),
                    bottom: buildBorderSide(),
                    right: buildBorderSide(),
                    left: buildBorderSide(),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (count > 0) {
                          setState(() {
                            count--;
                            price -= 15.25;
                          });
                        }
                      },
                      child: SvgPicture.asset(AppPath.ic_minus),
                    ),
                    Text(
                      '$count',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.cBlack_50,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (count >= 0) {
                          setState(() {
                            count++;
                            price += 15.25;
                          });
                        }
                      },
                      child: SvgPicture.asset(AppPath.ic_add),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                width: 24,
                height: 24,
                child: Checkbox(
                  checkColor: AppColors.white,
                  activeColor: AppColors.cYanPrimary,
                  side: BorderSide(
                    width: 0.5,
                    color: AppColors.cBlack,
                    style: BorderStyle.solid,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  value: listIndexSelect.contains(index),
                  onChanged: (checkBox) {
                    if (listIndexSelect.contains(index) == true) {
                      listIndexSelect.remove(index);
                    } else {
                      listIndexSelect.add(index);
                    }

                    setState(() {});
                  },
                ),
              ),
              Spacer(),
              SvgPicture.asset(AppPath.ic_trash),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildOderInfo(String title, double size, Color color, String price, FontWeight weight) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '$title',
          style: TextStyle(
            fontSize: size,
            fontWeight: weight,
            color: color,
          ),
        ),
        Spacer(),
        Text(
          '\$$price',
          style: TextStyle(
            fontSize: size,
            fontWeight: weight,
            color: color,
          ),
        ),
      ],
    );
  }

  Widget buildCheckout() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          color: AppColors.cBlack_50,
          borderRadius: BorderRadius.circular(12),
          border: Border(
            top: buildBorderSide(),
            bottom: buildBorderSide(),
            right: buildBorderSide(),
            left: buildBorderSide(),
          ),
        ),
        child: Center(
          child: Text(
            'Checkout (${listIndexSelect.length})',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leadingWidth: 48,
      toolbarHeight: 56,
      leading: Container(
        margin: EdgeInsets.only(left: 16),
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: SvgPicture.asset(AppPath.ic_back),
        ),
      ),
      title: Row(
        children: [
          Text(
            'My Cart',
            style: TextStyle(
              fontSize: 20,
              color: AppColors.cBlack_50,
              fontWeight: FontWeight.w500,
            ),
          ),
          Spacer(),
        ],
      ),
      actions: [
        Container(
          margin: EdgeInsets.only(right: 16),
          child: Text(
            'Voucher Code',
            style:
                TextStyle(color: AppColors.cYanPrimary, fontSize: 14, fontWeight: FontWeight.w400),
          ),
        )
      ],
    );
  }

  BorderSide buildBorderSide() {
    return BorderSide(
      width: 1,
      color: AppColors.cGray_50,
    );
  }
}
