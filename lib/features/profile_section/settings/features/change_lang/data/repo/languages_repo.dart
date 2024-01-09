import 'package:clean_car_customer_v2/constants/keys/api_keys.dart';
import 'package:clean_car_customer_v2/constants/res/api_config.dart';
import 'package:clean_car_customer_v2/data/repository/base_repository.dart';
import 'package:clean_car_customer_v2/features/profile_section/settings/features/change_lang/data/model/res/languages_res_model.dart';

class LanguagesRepository extends BaseRepository<LanguagesResModel>{
  LanguagesRepository():super(baseUrl: ApiKeys.languages);
}