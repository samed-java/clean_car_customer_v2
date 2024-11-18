import 'package:clean_car_customer_v2/data/model/request/base_request_model.dart';

class FilterReqModel extends BaseRequestModel{
  int? serviceId;
  int? cityId;
  int? regionId;
  int? villageId;
  bool? isFullTime;
  String? text;
  String? lat;
  String? lon;

  FilterReqModel({
    this.serviceId,
    this.cityId,
    this.regionId,
    this.villageId,
    this.isFullTime,
    this.text,
    this.lat,
    this.lon
});

  @override
  Map<String, dynamic> toJson() {
    return {
      "service_id":serviceId,
      "city_id":cityId,
      "region_id":regionId,
      "village_id":villageId,
      "is_fullTime":isFullTime,
      "text":text,
      "lat":lat,
      "lon":lon
    }..removeWhere((key, value) => value == null);
  }

}