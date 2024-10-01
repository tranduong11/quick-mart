import 'package:flutter/cupertino.dart';

class ProductDetailVm extends ChangeNotifier {
  int count = 0;
  double price = 15.25;
  int indicator = 0;
  bool check = false;

  void inDi(int i) {
    indicator = i;
    notifyListeners();
  }

  void countApart() {
    if (count > 0) {
      count--;
      price -= 15.25;
      notifyListeners();
    }
  }

  void countAdd() {
    if (count >= 0) {
      count++;
      price += 15.25;
      notifyListeners();
    }
  }
}
