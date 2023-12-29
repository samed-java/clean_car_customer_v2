class ReservationSubmitResModel {
  Reservation reservation;

  ReservationSubmitResModel({
    required this.reservation,
  });

  factory ReservationSubmitResModel.fromJson(Map<String, dynamic> json) => ReservationSubmitResModel(
    reservation: Reservation.fromJson(json["reservation"]),
  );

  Map<String, dynamic> toJson() => {
    "reservation": reservation.toJson(),
  };
}

class Reservation {
  int id;
  String washingName;
  String washingAddress;
  Car car;
  String service;
  String price;
  String day;
  String time;

  Reservation({
    required this.id,
    required this.washingName,
    required this.washingAddress,
    required this.car,
    required this.service,
    required this.price,
    required this.day,
    required this.time,
  });

  factory Reservation.fromJson(Map<String, dynamic> json) => Reservation(
    id: json["id"],
    washingName: json["washing_name"],
    washingAddress: json["washing_address"],
    car: Car.fromJson(json["car"]),
    service: json["service"],
    price: json["price"],
    day: json["day"],
    time: json["time"],
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
  };
}

class Car {
  int id;
  String carModel;
  String carNumber;
  BanType banType;

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
    banType: BanType.fromJson(json["ban_type"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "car_model": carModel,
    "car_number": carNumber,
    "ban_type": banType.toJson(),
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

