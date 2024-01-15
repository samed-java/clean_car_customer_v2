import '../../../my_cars/data/model/res/my_cars_res_model.dart';

class ReservationsResModel {
  Reservations reservations;

  ReservationsResModel({
    required this.reservations,
  });

  factory ReservationsResModel.fromJson(Map<String, dynamic> json) => ReservationsResModel(
    reservations: Reservations.fromJson(json["reservations"]),
  );

  Map<String, dynamic> toJson() => {
    "reservations": reservations.toJson(),
  };
}

class Reservations {
  List<Active> active;
  List<Active> history;

  Reservations({
    required this.active,
    required this.history,
  });

  factory Reservations.fromJson(Map<String, dynamic> json) => Reservations(
    active: List<Active>.from(json["active"].map((x) => Active.fromJson(x))),
    history: List<Active>.from(json["history"].map((x) => Active.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "active": List<dynamic>.from(active.map((x) => x.toJson())),
    "history": List<dynamic>.from(history.map((x) => x.toJson())),
  };
}

class Active {
  int id;
  String price;
  String day;
  String time;
  String status;
  String statusLabel;
  Washing washing;
  Car car;
  Service service;

  Active({
    required this.id,
    required this.price,
    required this.day,
    required this.time,
    required this.status,
    required this.washing,
    required this.car,
    required this.service,
    required this.statusLabel
  });

  factory Active.fromJson(Map<String, dynamic> json) => Active(
    id: json["id"],
    price: json["price"],
    day: json["day"],
    time: json["time"],
    status: json["status"],
    statusLabel: json["status_label"],
    washing: Washing.fromJson(json["washing"]),
    car: Car.fromJson(json["car"]),
    service: Service.fromJson(json["service"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "price": price,
    "day": day,
    "time": time,
    "status": status,
    "washing": washing.toJson(),
    "car": car.toJson(),
    "service": service.toJson(),
    "status_label": statusLabel,
  };
}

// class Car {
//   int id;
//   String carModel;
//   String carNumber;
//   BanType banType;
//
//   Car({
//     required this.id,
//     required this.carModel,
//     required this.carNumber,
//     required this.banType,
//   });
//
//   factory Car.fromJson(Map<String, dynamic> json) => Car(
//     id: json["id"],
//     carModel: json["car_model"],
//     carNumber: json["car_number"],
//     banType: BanType.fromJson(json["ban_type"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "car_model": carModel,
//     "car_number": carNumber,
//     "ban_type": banType.toJson(),
//   };
// }
//
// class BanType {
//   int id;
//   String title;
//   String icon;
//
//   BanType({
//     required this.id,
//     required this.title,
//     required this.icon,
//   });
//
//   factory BanType.fromJson(Map<String, dynamic> json) => BanType(
//     id: json["id"],
//     title: json["title"],
//     icon: json["icon"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "title": title,
//     "icon": icon,
//   };
// }
//
class Service {
  int id;
  String title;

  Service({
    required this.id,
    required this.title,
  });

  factory Service.fromJson(Map<String, dynamic> json) => Service(
    id: json["id"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
  };
}

class Washing {
  int id;
  String washingName;
  String washingAddress;
  String lat;
  String lon;

  Washing({
    required this.id,
    required this.washingName,
    required this.washingAddress,
    required this.lat,
    required this.lon
  });

  factory Washing.fromJson(Map<String, dynamic> json) => Washing(
    id: json["id"],
    washingName: json["washing_name"],
    washingAddress: json["washing_address"],
    lat: json["lat"],
      lon: json["lon"]
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "washing_name": washingName,
    "washing_address": washingAddress,
    "lat": lat,
    "lon": lon,
  };
}

