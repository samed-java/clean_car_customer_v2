import 'package:clean_car_customer_v2/constants/keys/api_keys.dart';
import 'package:clean_car_customer_v2/constants/res/api_config.dart';
import 'package:clean_car_customer_v2/data/repository/base_repository.dart';
import 'package:clean_car_customer_v2/features/login/data/model/res/login_res_model.dart';

class LoginRepository extends BaseRepository<LoginResModel>{
  LoginRepository():super(baseUrl: ApiKeys.login);
}