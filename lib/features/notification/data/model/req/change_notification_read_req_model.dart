import 'package:clean_car_customer_v2/data/model/request/base_request_model.dart';

class ChangeNotificationReadReqModel extends BaseRequestModel{
  bool isRead;

  ChangeNotificationReadReqModel({
    required this.isRead,
  });

  factory ChangeNotificationReadReqModel.fromJson(Map<String, dynamic> json) => ChangeNotificationReadReqModel(
    isRead: json["is_read"],
  );

  @override
  Map<String, dynamic> toJson() => {
    "is_read": isRead,
  };
}
