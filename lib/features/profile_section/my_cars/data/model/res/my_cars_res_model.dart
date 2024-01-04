class CarsResModel {
  List<Car>? cars;
  Car? car;

  CarsResModel({
    required this.car,
    required this.cars,
  });

  factory CarsResModel.fromJson(Map<String, dynamic> json) => CarsResModel(
        car: json["car"] != null ? Car.fromJson(json["car"]) : null,
        cars: json["cars"] != null
            ? List<Car>.from(json["cars"].map((x) => Car.fromJson(x)))
            : null,
      );

  Map<String, dynamic> toJson() => {
        "car": car,
        "cars": cars != null
            ? List<dynamic>.from(cars!.map((x) => x.toJson()))
            : null,
      };
}

class Car {
  int id;
  String carModel;
  String carNumber;
  BanType? banType;

  Car({
    required this.id,
    required this.carModel,
    required this.carNumber,
    required this.banType,
  });

  factory Car.fromJson(Map<String, dynamic> json) => Car(
        id: json["id"],
        carModel: json["car_model"],
        carNumber: json["car_number"],
        banType: json["ban_type"] != null
            ? BanType.fromJson(json["ban_type"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "car_model": carModel,
        "car_number": carNumber,
        "ban_type": banType?.toJson(),
      };
}

class BanType {
  int id;
  String title;
  String icon;

  BanType({required this.id, required this.title, required this.icon});

  factory BanType.fromJson(Map<String, dynamic> json) =>
      BanType(id: json["id"], title: json["title"], icon: json['icon']);

  Map<String, dynamic> toJson() => {"id": id, "title": title, "icon": icon};
}
