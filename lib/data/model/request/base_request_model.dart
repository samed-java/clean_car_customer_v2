abstract class BaseRequestModel {
  final String method;
  BaseRequestModel({required this.method});
  Map<String, dynamic> toJson();
}
