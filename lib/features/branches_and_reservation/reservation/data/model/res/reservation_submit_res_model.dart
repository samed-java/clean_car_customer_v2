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
  String price;
  int phone;
  String day;
  String time;
  String status;
  String statusLabel;
  Washing washing;
  Car car;
  Service service;

  Reservation({
    required this.id,
    required this.price,
    required this.phone,
    required this.day,
    required this.time,
    required this.status,
    required this.statusLabel,
    required this.washing,
    required this.car,
    required this.service,
  });

  factory Reservation.fromJson(Map<String, dynamic> json) => Reservation(
    id: json["id"],
    price: json["price"],
    phone: json["phone"],
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
    "phone": phone,
    "day": day,
    "time": time,
    "status": status,
    "status_label": statusLabel,
    "washing": washing.toJson(),
    "car": car.toJson(),
    "service": service.toJson(),
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
    required this.lon,
  });

  factory Washing.fromJson(Map<String, dynamic> json) => Washing(
    id: json["id"],
    washingName: json["washing_name"],
    washingAddress: json["washing_address"],
    lat: json["lat"],
    lon: json["lon"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "washing_name": washingName,
    "washing_address": washingAddress,
    "lat": lat,
    "lon": lon,
  };
}
