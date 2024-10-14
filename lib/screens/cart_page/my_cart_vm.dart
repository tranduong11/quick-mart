import 'package:flutter/material.dart';
import 'package:quick_mart/data_local/hive_db.dart';
import 'package:quick_mart/models/entity/hive_entity/item_cart.dart';

class MyCartVm extends ChangeNotifier {
  int count = 0;
  int? indexSelectItem = 0;
  String images1 = '';

  List<int> listIndexSelect = [];
  List<ItemCart> listData = [];

  void Reduce() {
    if (count > 0) {
      count--;
    }
    notifyListeners();
  }

  void Increase() {
    if (count >= 0) {
      count++;
    }
    notifyListeners();
  }

  void getData() {
    HiveData.instance.getListCart().then((value) {
      listData = value ?? [];
      notifyListeners();
    });
  }
}
