import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quick_mart/models/entity/hive_entity/item_cart.dart';
import 'package:quick_mart/utils/app_logger.dart';

class HiveData {
  HiveData._();

  static HiveData? _instance;

  static HiveData get instance {
    if (_instance != null) {
      return _instance!;
    } else {
      _instance = HiveData._();
      return _instance!;
    }
  }

  /// key hive
  String keyCart = 'tableDataCart';
  String keyAddress = 'key_address';

  void initHive() async {
    final appDocumentDirectory = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDirectory.path);
    Hive.registerAdapter(ItemCartAdapter());
  }

  Future<void> addProject(ItemCart item) async {
    try {
      var box = await Hive.openBox(keyCart);
      List<dynamic>? list = [];
      list = await box.get(keyCart);
      List<ItemCart>? listA = List<ItemCart>.from(list ?? []);
      listA.add(item);
      box.put(keyCart, listA);
    } catch (e) {
      logger.e(e);
    }
  }

  // Future<void> addProjectDeep(List<AlbumEntity> projects) async {
  //   var box = await Hive.openBox(keyAlbum);
  //   box.put(keyAlbum, projects);
  // }
  //
  Future<List<ItemCart>?> getListCart() async {
    try {
      final box = await Hive.openBox(keyCart);
      List<dynamic>? list = [];
      list = await box.get(keyCart);
      List<ItemCart>? listA = List<ItemCart>.from(list ?? []);
      return listA;
    } catch (e) {
      logger.e(e);
      return [];
    }
  }
// Future<List<AlbumEntity>?> getProjectsDeep() async {
//   try {
//     final box = await Hive.openBox(keyAlbum);
//     List<dynamic>? list = [];
//     list = await box.get(keyAlbum);
//     List<AlbumEntity>? listA = List<AlbumEntity>.from(list ?? []);
//     return listA;
//   } catch (e) {
//     logger.e(e);
//     return [];
//   }
// }
//
// Future<void> addAddress(List<AddressEntity> address) async {
//   var box = await Hive.openBox(keyAddress);
//   box.put(keyAddress, address);
// }
//
// Future<List<AddressEntity>> getAddress() async {
//   try {
//     final box = await Hive.openBox(keyAddress);
//     List<dynamic>? list = await box.get(keyAddress);
//     List<AddressEntity>? address = list?.cast<AddressEntity>();
//     return address ?? [];
//   } catch (e) {
//     logger.e(e);
//     return [];
//   }
// }
}
