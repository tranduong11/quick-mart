import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:quick_mart/models/entity/firebase_entity/categories_entity.dart';

class CateGoRiVm extends ChangeNotifier {
  List<CategoriesEntity> listCard = [];

  Future<void> fetchData({
    required BuildContext context,
  }) async {
    await FirebaseFirestore.instance.collection("categories").get().then((data) {
      data.docs.forEach((result) {
        listCard.add(CategoriesEntity.fromJson(result));
      });
      notifyListeners();
    });
  }
}
