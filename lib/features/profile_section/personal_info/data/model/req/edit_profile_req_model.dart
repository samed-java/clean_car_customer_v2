import 'package:clean_car_customer_v2/data/model/request/base_request_model.dart';

class EditProfileReqModel extends BaseRequestModel{
  String name;
  String email;
  String phone;

  EditProfileReqModel({
    required this.name,
    required this.email,
    required this.phone,
  });

  factory EditProfileReqModel.fromJson(Map<String, dynamic> json) => EditProfileReqModel(
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "phone": phone,
  };
}
