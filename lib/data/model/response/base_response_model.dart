import 'base_response_data.dart';

class BaseResponseModel<T> {
  String? result;
  Error? error;
  T? data;

  BaseResponseModel({this.result, this.error, this.data});
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
