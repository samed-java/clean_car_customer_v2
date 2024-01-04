import '../../../my_cars/data/model/res/my_cars_res_model.dart';

class ReservationsResModel {
  Reservations reservations;

  ReservationsResModel({
    required this.reservations,
  });

  factory ReservationsResModel.fromJson(Map<String, dynamic> json) =>
      ReservationsResModel(
        reservations: Reservations.fromJson(json["reservations"]),
      );

  Map<String, dynamic> toJson() => {
        "reservations": reservations.toJson(),
      };
}

class Reservations {
  List<Active> active;
  List<dynamic> history;

  Reservations({
    required this.active,
    required this.history,
  });

  factory Reservations.fromJson(Map<String, dynamic> json) => Reservations(
        active:
            List<Active>.from(json["active"].map((x) => Active.fromJson(x))),
        history: List<dynamic>.from(json["history"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "active": List<dynamic>.from(active.map((x) => x.toJson())),
        "history": List<dynamic>.from(history.map((x) => x)),
      };
}

class Active {
  int id;
  String washingName;
  String washingAddress;
  Car car;
  String service;
  String price;
  String day;
  String time;
  String status;

  Active({
    required this.id,
    required this.washingName,
    required this.washingAddress,
    required this.car,
    required this.service,
    required this.price,
    required this.day,
    required this.time,
    required this.status,
  });

  factory Active.fromJson(Map<String, dynamic> json) => Active(
        id: json["id"],
        washingName: json["washing_name"],
        washingAddress: json["washing_address"],
        car: Car.fromJson(json["car"]),
        service: json["service"],
        price: json["price"],
        day: json["day"],
        time: json["time"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "washing_name": washingName,
        "washing_address": washingAddress,
        "car": car.toJson(),
        "service": service,
        "price": price,
        "day": day,
        "time": time,
        "status": status,
      };
}

class BanType {
  int id;
  String title;
  String icon;

  BanType({
    required this.id,
    required this.title,
    required this.icon,
  });

  factory BanType.fromJson(Map<String, dynamic> json) => BanType(
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
