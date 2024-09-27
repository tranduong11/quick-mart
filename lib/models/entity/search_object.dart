class SearchListHome {
  SearchListHome({
    this.title,
    this.icon,
  });

  SearchListHome.fromJson(dynamic json) {
    title = json['title'];
    icon = json['icon'];
  }
  String? title;
  String? icon;
  SearchListHome copyWith({
    String? title,
    String? icon,
  }) =>
      SearchListHome(
        title: title ?? this.title,
        icon: icon ?? this.icon,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['icon'] = icon;
    return map;
  }
}
