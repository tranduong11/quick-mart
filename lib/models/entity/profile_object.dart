class ProfileObject {
  ProfileObject({
    this.images,
    this.title,
    this.icon,
  });

  ProfileObject.fromJson(dynamic json) {
    images = json['images'];
    title = json['title'];
    icon = json['icon'];
  }
  String? images;
  String? title;
  String? icon;
  ProfileObject copyWith({
    String? images,
    String? title,
    String? icon,
  }) =>
      ProfileObject(
        images: images ?? this.images,
        title: title ?? this.title,
        icon: icon ?? this.icon,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['images'] = images;
    map['title'] = title;
    map['icon'] = icon;
    return map;
  }
}
