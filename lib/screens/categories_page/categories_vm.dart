import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:quick_mart/models/entity/firebase_entity/categories_entity.dart';

class CateGoRiVm extends ChangeNotifier {
  List<CategoriesEntity> listCard = [];
  bool isLoading = false;

  Future<void> fetchData() async {
    isLoading = true;
    notifyListeners();
    try {
      await FirebaseFirestore.instance.collection("categories").get().then((data) {
        data.docs.forEach((result) {
          listCard.add(CategoriesEntity.fromJson(result));
        });
        notifyListeners();
      });
      isLoading = false;
      notifyListeners();
    } catch (e) {
      print('Loi hien thi data!!');
    }
  }
}
