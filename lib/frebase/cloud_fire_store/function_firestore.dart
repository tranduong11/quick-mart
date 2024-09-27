import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quick_mart/models/entity/firebase_entity/product_entity.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = firestore.collection('data');

class FireStoreFunction {
  FireStoreFunction._();

  static FireStoreFunction? _instance;

  static FireStoreFunction get instance {
    if (_instance != null) {
      return _instance!;
    } else {
      _instance = FireStoreFunction._();
      return _instance!;
    }
  }

//Thêm dữ liệu lên subCollection trong 1 collection firebase fireStore : Trạng thái sử dụng oke
  void addData(ProductEntity data) async {
    await FirebaseFirestore.instance.collection('users').add(data.toJson());
  }

// setData đến từng document cụ thể trong một collection nào đó
  void setData() {
    FirebaseFirestore.instance
        .collection('data')
        .doc('test_crud')
        .set({'field': 'value'}, SetOptions(merge: true)).then((value) {
      //Do your stuff.
    });
  }

// Thêm dữ liệu vào chỉ 1 collection
  void addDataCollection(ProductEntity data) async {
    await FirebaseFirestore.instance.collection('product').add(data.toJson());
  }

  // Update dữ liệu trong 1 collection fireStore
  void updateData(ProductEntity productEntity, String id) async {
    await FirebaseFirestore.instance.collection('product').doc(id).update(
          productEntity.toJson(),
        );
  }

  // Đọc dữu liệu trong collection có nội dung là email,
  Future<Map<String, dynamic>?> readData() async {
    var snapshot = await FirebaseFirestore.instance.collection('data').doc('email').get();
    var userData = snapshot.data();
    return userData;
  }

  Future onPressed() async {
    await FirebaseFirestore.instance.collection("data").get().then((data) {
      data.docs.forEach((result) {
        print(result.data());
      });
    });
  }

// add list collection firebase fireStore
// Future<void> addProduct(List<ProductEntity> listCopyWith) async {
//   for (var listCopyWith in listCopyWith) {
//     await firestore.collection('products').add(listCopyWith.toJson());
//   }
// }
}
