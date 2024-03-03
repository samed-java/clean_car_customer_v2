class BanTypesResModel {
  List<Ban> bans;

  BanTypesResModel({
    required this.bans,
  });

  factory BanTypesResModel.fromJson(Map<String, dynamic> json) =>
      BanTypesResModel(
        bans: List<Ban>.from(json["bans"].map((x) => Ban.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "bans": List<dynamic>.from(bans.map((x) => x.toJson())),
      };
}

class Ban {
  int id;
  String title;
  String icon;

  Ban({
    required this.id,
    required this.title,
    required this.icon,
  });

  factory Ban.fromJson(Map<String, dynamic> json) => Ban(
        id: json["id"],
        title: json["title"],
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "icon": icon,
      };
}
