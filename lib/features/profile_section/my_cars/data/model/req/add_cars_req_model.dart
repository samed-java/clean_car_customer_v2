import 'package:clean_car_customer_v2/data/model/request/base_request_model.dart';

class AddCarsReqModel extends BaseRequestModel{
  String carModel;
  String carNumber;
  String banId;

  AddCarsReqModel({
    required this.carModel,
    required this.carNumber,
    required this.banId,
  });

  factory AddCarsReqModel.fromJson(Map<String, dynamic> json) => AddCarsReqModel(
    carModel: json["car_model"],
    carNumber: json["car_number"],
    banId: json["ban_id"],
  );

  @override
  Map<String, dynamic> toJson() => {
    "car_model": carModel,
    "car_number": carNumber,
    "ban_id": banId,
  };
}
