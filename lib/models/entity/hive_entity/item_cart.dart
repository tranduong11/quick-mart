import 'package:hive/hive.dart';

part 'item_cart.g.dart';

@HiveType(typeId: 1)
class ItemCart extends HiveObject {
  @HiveField(0)
  final String? images;

  @HiveField(1)
  final String? title;

  @HiveField(2)
  final String? price;

  ItemCart({
    this.images,
    this.title,
    this.price,
  });
}
