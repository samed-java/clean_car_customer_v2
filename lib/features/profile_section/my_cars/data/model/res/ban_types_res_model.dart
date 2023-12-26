class BanTypesResModel {
  List<Ban> bans;

  BanTypesResModel({
    required this.bans,
  });

  factory BanTypesResModel.fromJson(Map<String, dynamic> json) => BanTypesResModel(
    bans: List<Ban>.from(json["bans"].map((x) => Ban.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "bans": List<dynamic>.from(bans.map((x) => x.toJson())),
  };
}

class Ban {
  int id;
  String title;

  Ban({
    required this.id,
    required this.title,
  });

  factory Ban.fromJson(Map<String, dynamic> json) => Ban(
    id: json["id"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
  };
}
