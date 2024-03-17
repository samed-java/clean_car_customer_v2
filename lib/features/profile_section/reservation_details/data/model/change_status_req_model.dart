import 'package:clean_car_customer_v2/data/model/request/base_request_model.dart';

class ChangeStatusReqModel extends BaseRequestModel {
  int id;
  int status;

  ChangeStatusReqModel({
    required this.id,
    required this.status,
  });

  @override
  Map<String, dynamic> toJson() {
    return {"id": id, "status": status};
  }
}
