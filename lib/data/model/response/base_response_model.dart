import 'base_response_data.dart';

class BaseResponseModel<T>{
  bool? success;
  T? data;
  String? message;

  BaseResponseModel({
    required this.success,
    required this.data,
    required this.message,
  });

}

class Error {
  String message;
  String code;

  Error({
    required this.message,
    required this.code,
  });

  factory Error.fromJson(Map<String, dynamic> json) => Error(
        message: json["message"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "code": code,
      };
}
