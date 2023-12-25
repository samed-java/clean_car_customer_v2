class LoginResModel {
  String phone;
  String otpToken;

  LoginResModel({
    required this.phone,
    required this.otpToken,
  });

  factory LoginResModel.fromJson(Map<String, dynamic> json) => LoginResModel(
    phone: json["phone"],
    otpToken: json["otp_token"],
  );

  Map<String, dynamic> toJson() => {
    "phone": phone,
    "otp_token": otpToken,
  };
}