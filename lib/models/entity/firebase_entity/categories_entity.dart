class CategoriesEntity {
  CategoriesEntity({
    this.idProduct,
    this.images,
    this.title,
  });

  CategoriesEntity.fromJson(dynamic json) {
    idProduct = json['idProduct'];
    images = json['images'];
    title = json['title'];
  }
  String? idProduct;
  String? images;
  String? title;
  CategoriesEntity copyWith({
    String? idProduct,
    String? images,
    String? title,
  }) =>
      CategoriesEntity(
        idProduct: idProduct ?? this.idProduct,
        images: images ?? this.images,
        title: title ?? this.title,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['idProduct'] = idProduct;
    map['images'] = images;
    map['title'] = title;
    return map;
  }
}
