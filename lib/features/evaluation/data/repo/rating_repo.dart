import 'package:clean_car_customer_v2/constants/keys/api_keys.dart';
import 'package:clean_car_customer_v2/constants/keys/api_methohs.dart';
import 'package:clean_car_customer_v2/constants/res/api_config.dart';
import 'package:clean_car_customer_v2/data/repository/base_repository.dart';
import 'package:clean_car_customer_v2/features/evaluation/data/model/res/rating_res_model.dart';

class RatingRepository extends BaseRepository<RatingResModel>{
  RatingRepository():super(baseUrl: ApiKeys.rating);
}