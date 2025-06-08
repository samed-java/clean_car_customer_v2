import 'package:clean_car_customer_v2/data/model/request/base_request_model.dart';

class ReservationSubmitReqModel extends BaseRequestModel {
  String washingId;
  String serviceId;
  String carId;
  String day;
  String time;
  String price;
  String? discountedPrice;
  int? status;

  ReservationSubmitReqModel({
    required this.washingId,
    required this.serviceId,
    required this.carId,
    required this.day,
    required this.time,
    required this.price,
    this.discountedPrice,
    this.status,
  });

  factory ReservationSubmitReqModel.fromJson(Map<String, dynamic> json) =>
      ReservationSubmitReqModel(
        washingId: json["washing_id"],
        serviceId: json["service_id"],
        carId: json["car_id"],
        day: json["day"],
        time: json["time"],
        price: json["price"],
        discountedPrice: json["discounted_price"],
        status: json["status"],
      );

  @override
  Map<String, dynamic> toJson() => {
        "washing_id": washingId,
        "service_id": serviceId,
        "car_id": carId,
        "day": day,
        "time": time,
        "price": price,
        "status": status,
        "discounted_price": discountedPrice,
      };
}
