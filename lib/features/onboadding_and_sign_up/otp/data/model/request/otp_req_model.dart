import 'package:clean_car_customer_v2/data/model/request/base_request_model.dart';

class OtpReqModel extends BaseRequestModel{
  String phone;
  int otpCode;

  OtpReqModel({
    required this.phone,
    required this.otpCode,
  });

  factory OtpReqModel.fromJson(Map<String, dynamic> json) => OtpReqModel(
    phone: json["phone"],
    otpCode: json["otp_code"],
  );

  @override
  Map<String, dynamic> toJson() => {
    "phone": phone,
    "otp_code": otpCode,
  };
}
