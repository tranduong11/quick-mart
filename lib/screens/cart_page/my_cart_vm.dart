import 'package:flutter/material.dart';
import 'package:quick_mart/data_local/hive_db.dart';
import 'package:quick_mart/models/entity/hive_entity/item_cart.dart';

class MyCartVm extends ChangeNotifier {
  int? indexSelectItem = 0;
  String images1 = '';

  List<int> listIndexSelect = [];
  List<ItemCart> listData = [];

  void Reduce(int index) {
    if (listData[index].count! > 0) {
      listData[index].count = (listData[index].count ?? 0) - 1;
      listData[index].save();
      notifyListeners();
    }
    notifyListeners();
  }

  void Increase(int index) {
    if (listData[index].count! >= 0) {
      listData[index].count = (listData[index].count ?? 0) + 1;
      listData[index].save();
      notifyListeners();
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
