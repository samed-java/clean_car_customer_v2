import 'package:clean_car_customer_v2/data/model/request/base_request_model.dart';

class ReservationParametersReqModel extends BaseRequestModel {
  int? washingId;
  int? banId;
  String? date;

  ReservationParametersReqModel({this.washingId, this.banId, this.date});

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "washing_id": washingId,
      "ban_id": banId,
      "date": date,
    }..removeWhere((key, value) => value==null);
  }
}
