import 'package:clean_car_customer_v2/data/model/request/base_request_model.dart';

class SignUpReqModel extends BaseRequestModel{
  String phone;
  String name;
  String email;

  SignUpReqModel({
    required this.phone,
    required this.name,
    required this.email,
  });

  Map<String, dynamic> toJson() => {
    "phone": phone,
    "name": name,
    "email": email,
  };
}
