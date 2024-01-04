class ServicesResModel {
  List<ServiceItem> services;

  ServicesResModel({
    required this.services,
  });

  factory ServicesResModel.fromJson(Map<String, dynamic> json) =>
      ServicesResModel(
        services: List<ServiceItem>.from(
            json["services"].map((x) => ServiceItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "services": List<dynamic>.from(services.map((x) => x.toJson())),
      };
}

class ServiceItem {
  int id;
  String title;
  String icon;
  String iconBlue;

  ServiceItem({
    required this.id,
    required this.title,
    required this.icon,
    required this.iconBlue,
  });

  factory ServiceItem.fromJson(Map<String, dynamic> json) => ServiceItem(
        id: json["id"],
        title: json["title"],
        icon: json["icon"],
        iconBlue: json["icon_blue"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "icon": icon,
        "icon_blue": iconBlue,
      };
}
