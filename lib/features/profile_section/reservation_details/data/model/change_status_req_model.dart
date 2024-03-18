import 'package:clean_car_customer_v2/data/model/request/base_request_model.dart';

class ChangeStatusReqModel extends BaseRequestModel {
  int reservationId;
  int status;

  ChangeStatusReqModel({
    required this.reservationId,
    required this.status,
  });

  @override
  Map<String, dynamic> toJson() {
    return {"reservation_id": reservationId, "status": status};
  }
}
