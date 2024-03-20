import 'package:clean_car_customer_v2/data/model/request/base_request_model.dart';

class RatingReqModel extends BaseRequestModel{
  String reservationId;
  String comment;
  String rating;

  RatingReqModel({
    required this.reservationId,
    required this.comment,
    required this.rating,
  });

  factory RatingReqModel.fromJson(Map<String, dynamic> json) => RatingReqModel(
    reservationId: json["reservation_id"],
    comment: json["comment"],
    rating: json["rating"],
  );

  Map<String, dynamic> toJson() => {
    "reservation_id": reservationId,
    "comment": comment,
    "rating": rating,
  };
}
