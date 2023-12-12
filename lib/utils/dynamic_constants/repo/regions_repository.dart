import 'package:clean_car_customer_v2/constants/keys/api_keys.dart';
import 'package:clean_car_customer_v2/data/repository/base_repository.dart';
import '../data/model/response/regions_response_model.dart';

class RegionsRepository extends BaseRepository<RegionsResModel>{
  RegionsRepository():super(baseUrl: ApiKeys.getRegions);
}