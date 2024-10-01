class ProductsHome {
  ProductsHome({
    this.color,
    this.images,
    this.subimages,
    this.allcolor,
    this.title,
    this.price,
    this.subsprice,
  });

  ProductsHome.fromJson(dynamic json) {
    color = json['color'];
    images = json['images'];
    subimages = json['subimages'];
    allcolor = json['allcolor'];
    title = json['title'];
    price = json['price'];
    subsprice = json['subsprice'];
  }
  String? color;
  String? images;
  String? subimages;
  String? allcolor;
  String? title;
  String? price;
  String? subsprice;
  ProductsHome copyWith({
    String? color,
    String? images,
    String? subimages,
    String? allcolor,
    String? title,
    String? price,
    String? subsprice,
  }) =>
      ProductsHome(
        color: color ?? this.color,
        images: images ?? this.images,
        subimages: subimages ?? this.subimages,
        allcolor: allcolor ?? this.allcolor,
        title: title ?? this.title,
        price: price ?? this.price,
        subsprice: subsprice ?? this.subsprice,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['color'] = color;
    map['images'] = images;
    map['subimages'] = subimages;
    map['allcolor'] = allcolor;
    map['title'] = title;
    map['price'] = price;
    map['subsprice'] = subsprice;
    return map;
  }
}
