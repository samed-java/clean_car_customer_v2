import 'package:clean_car_customer_v2/constants/keys/api_keys.dart';
import 'package:clean_car_customer_v2/data/repository/base_repository.dart';
import 'package:clean_car_customer_v2/utils/language/data/model/response/language_response_model.dart';

class LanguageRepository extends BaseRepository<LanguageResponseModel>{
  LanguageRepository():super(baseUrl: ApiKeys.getLanguages);
}