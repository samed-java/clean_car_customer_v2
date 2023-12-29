class RegionResModel {
  List<Region> regions;

  RegionResModel({
    required this.regions,
  });

  factory RegionResModel.fromJson(Map<String, dynamic> json) => RegionResModel(
    regions: List<Region>.from(json["regions"].map((x) => Region.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "regions": List<dynamic>.from(regions.map((x) => x.toJson())),
  };
}

class Region {
  int id;
  String title;
  int? parentId;
  int type;
  DateTime createdAt;
  DateTime updatedAt;
  List<Region>? regions;
  List<Translation> translations;
  List<Region>? villages;

  Region({
    required this.id,
    required this.title,
    required this.parentId,
    required this.type,
    required this.createdAt,
    required this.updatedAt,
    this.regions,
    required this.translations,
    this.villages,
  });

  factory Region.fromJson(Map<String, dynamic> json) => Region(
    id: json["id"],
    title: json["title"],
    parentId: json["parent_id"],
    type: json["type"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    regions: json["regions"] == null ? [] : List<Region>.from(json["regions"]!.map((x) => Region.fromJson(x))),
    translations: List<Translation>.from(json["translations"].map((x) => Translation.fromJson(x))),
    villages: json["villages"] == null ? [] : List<Region>.from(json["villages"]!.map((x) => Region.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "parent_id": parentId,
    "type": type,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "regions": regions == null ? [] : List<dynamic>.from(regions!.map((x) => x.toJson())),
    "translations": List<dynamic>.from(translations.map((x) => x.toJson())),
    "villages": villages == null ? [] : List<dynamic>.from(villages!.map((x) => x.toJson())),
  };

}

class Translation {
  int id;
  int regionId;
  String locale;
  String title;
  dynamic createdAt;
  dynamic updatedAt;

  Translation({
    required this.id,
    required this.regionId,
    required this.locale,
    required this.title,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Translation.fromJson(Map<String, dynamic> json) => Translation(
    id: json["id"],
    regionId: json["region_id"],
    locale:json["locale"]!,
    title: json["title"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "region_id": regionId,
    "locale": locale,
    "title": title,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}

// enum Locale {
//   AZ,
//   EN,
//   RU
// }

// final localeValues = EnumValues({
//   "az": Locale.AZ,
//   "en": Locale.EN,
//   "ru": Locale.RU
// });

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
