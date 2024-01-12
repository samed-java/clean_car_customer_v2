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

  factory ReservationParametersResModel.fromJson(Map<String, dynamic> json) => ReservationParametersResModel(
    washings:json["washings"]?.map<Branch>((x) => Branch.fromJson(x)).toList(),
    cars: json["cars"]?.map<Car>((x) => Car.fromJson(x)).toList(),
    times: json["times"]?.map<Time>((x) => Time.fromJson(x)).toList(),
    services: json["services"]?.map<Service>((x) => Service.fromJson(x)).toList(),
  );

  Map<String, dynamic> toJson() => {
    "washings": washings?.map((x) => x.toJson()).toList(),
    "cars": cars?.map((x) => x.toJson()).toList(),
    "times": times?.map((x) => x.toJson()).toList(),
    "services": services?.map((x) => x.toJson()).toList(),
  };
}



class Service extends Equatable{
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

class Time extends Equatable{
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
  List<Object?> get props =>[time];
}

class Branch extends Equatable{
  final int id;
  final String washingName;
  final String address;

  const Branch({
    required this.id,
    required this.washingName,
    required this.address,
  });

  factory Branch.fromJson(Map<String, dynamic> json) => Branch(
    id: json["id"],
    washingName: json["washing_name"],
    address: json["address"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "washing_name": washingName,
    "address": address,
  };

  @override
  // TODO: implement props
  List<Object?> get props => [id,washingName,address];
}
