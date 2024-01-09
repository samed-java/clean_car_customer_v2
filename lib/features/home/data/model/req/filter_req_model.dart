import 'package:clean_car_customer_v2/data/model/request/base_request_model.dart';

class FilterReqModel extends BaseRequestModel{
  int? serviceId;
  int? cityId;
  int? regionId;
  int? villageId;
  String? text;

  FilterReqModel({
    this.serviceId,
    this.cityId,
    this.regionId,
    this.villageId,
    this.text
});

  @override
  Map<String, dynamic> toJson() {
    return {
      "service_id":serviceId,
      "city_id":cityId,
      "region_id":regionId,
      "village_id":villageId,
      "text":text,
    }..removeWhere((key, value) => value == null);
  }

}