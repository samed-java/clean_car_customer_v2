import 'package:clean_car_customer_v2/data/model/request/base_request_model.dart';

class LoginReqModel extends BaseRequestModel{
  String phone;

  LoginReqModel({
    required this.phone,
  });

  factory LoginReqModel.fromJson(Map<String, dynamic> json) => LoginReqModel(
    phone: json["phone"],
  );

  @override
  Map<String, dynamic> toJson() => {
    "phone": phone,
  };
}