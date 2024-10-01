class ProductEntity {
  ProductEntity({
    this.id,
    this.idProduct,
    this.images,
    this.title,
    this.price,
    this.detail,
  });

  ProductEntity.fromJson(dynamic json) {
    id = json['id'];
    idProduct = json['idProduct'];
    images = json['images'];
    title = json['title'];
    price = json['price'];
    detail = json['detail'];
  }
  String? id;
  String? idProduct;
  String? images;
  String? title;
  String? price;
  String? detail;
  ProductEntity copyWith({
    String? id,
    String? idProduct,
    String? images,
    String? title,
    String? price,
    String? detail,
  }) =>
      ProductEntity(
        id: id ?? this.id,
        idProduct: idProduct ?? this.idProduct,
        images: images ?? this.images,
        title: title ?? this.title,
        price: price ?? this.price,
        detail: detail ?? this.detail,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['idProduct'] = idProduct;
    map['images'] = images;
    map['title'] = title;
    map['price'] = price;
    map['detail'] = detail;
    return map;
  }
}
