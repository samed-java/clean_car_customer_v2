class RegionsResModel {
  List<Region> regions;

  RegionsResModel({
    required this.regions,
  });

  factory RegionsResModel.fromJson(Map<String, dynamic> json) => RegionsResModel(
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
  DateTime? createdAt;
  DateTime updatedAt;
  List<Region>? regions;
  List<Region>? villages;

  Region({
    required this.id,
    required this.title,
    required this.parentId,
    required this.type,
    required this.createdAt,
    required this.updatedAt,
    this.regions,
    this.villages,
  });

  factory Region.fromJson(Map<String, dynamic> json) => Region(
    id: json["id"],
    title: json["title"],
    parentId: json["parent_id"],
    type: json["type"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    regions: json["regions"] == null ? [] : List<Region>.from(json["regions"]!.map((x) => Region.fromJson(x))),
    villages: json["villages"] == null ? [] : List<Region>.from(json["villages"]!.map((x) => Region.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "parent_id": parentId,
    "type": type,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "regions": regions == null ? [] : List<dynamic>.from(regions!.map((x) => x.toJson())),
    "villages": villages == null ? [] : List<dynamic>.from(villages!.map((x) => x.toJson())),
  };
}
