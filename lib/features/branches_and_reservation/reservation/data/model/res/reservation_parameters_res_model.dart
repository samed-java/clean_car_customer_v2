import 'package:equatable/equatable.dart';

import '../../../../../profile_section/my_cars/data/model/res/my_cars_res_model.dart';

class ReservationParametersResModel {
  List<Branch>? washings;
  List<Car>? cars;
  List<Time>? times;
  List<Service>? services;

  ReservationParametersResModel({
    required this.washings,
    required this.cars,
    required this.times,
    required this.services,
  });

  factory ReservationParametersResModel.fromJson(Map<String, dynamic> json) =>
      ReservationParametersResModel(
        washings:
            json["washings"]?.map<Branch>((x) => Branch.fromJson(x)).toList(),
        cars: json["cars"]?.map<Car>((x) => Car.fromJson(x)).toList(),
        times: json["times"]?.map<Time>((x) => Time.fromJson(x)).toList(),
        services:
            json["services"]?.map<Service>((x) => Service.fromJson(x)).toList(),
      );

  Map<String, dynamic> toJson() => {
        "washings": washings?.map((x) => x.toJson()).toList(),
        "cars": cars?.map((x) => x.toJson()).toList(),
        "times": times?.map((x) => x.toJson()).toList(),
        "services": services?.map((x) => x.toJson()).toList(),
      };
}

class Service extends Equatable {
  final int serviceId;
  final String title;
  final String icon;
  final String price;

  const Service({
    required this.serviceId,
    required this.title,
    required this.icon,
    required this.price,
  });

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        serviceId: json["service_id"],
        title: json["title"],
        icon: json["icon"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "service_id": serviceId,
        "title": title,
        "icon": icon,
        "price": price,
      };

  @override
  // TODO: implement props
  List<Object?> get props => [serviceId];
}

class Time extends Equatable {
  final String time;
  final bool isReserved;

  const Time({
    required this.time,
    required this.isReserved,
  });

  factory Time.fromJson(Map<String, dynamic> json) => Time(
        time: json["time"],
        isReserved: json["is_reserved"],
      );

  Map<String, dynamic> toJson() => {
        "time": time,
        "is_reserved": isReserved,
      };

  @override
  // TODO: implement props
  List<Object?> get props => [time];
}

class Branch extends Equatable {
  int id;
  String washingName;
  String address;
  String lat;
  String lon;
  List<Product> products;

  Branch({
    required this.id,
    required this.washingName,
    required this.address,
    required this.lat,
    required this.lon,
    this.products = const <Product>[],
  });

  factory Branch.fromJson(Map<String, dynamic> json) => Branch(
        id: json["id"],
        washingName: json["washing_name"],
        address: json["address"],
        lat: json["lat"],
        lon: json["lon"],
        products: json["products"]?.map((x) => Product.fromJson(x)).toList()??<Product>[],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "washing_name": washingName,
        "address": address,
        "lat": lat,
        "lon": lon,
        "products": products.map((x) => x.toJson()).toList(),
      };

  @override
  // TODO: implement props
  List<Object?> get props => [id, washingName, address];
}

class Product extends Equatable {
  int id;
  int washingId;
  String title;
  String value;
  String price;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  Product({
    required this.id,
    required this.washingId,
    required this.title,
    required this.value,
    required this.price,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        washingId: json["washing_id"],
        title: json["title"],
        value: json["value"],
        price: json["price"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "washing_id": washingId,
        "title": title,
        "value": value,
        "price": price,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
      };

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        washingId,
        title,
        value,
        price,
      ];
}
