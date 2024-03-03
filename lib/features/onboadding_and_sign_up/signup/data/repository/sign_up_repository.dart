import 'package:clean_car_customer_v2/constants/keys/api_keys.dart';
import 'package:clean_car_customer_v2/data/repository/base_repository.dart';
import 'package:clean_car_customer_v2/features/onboadding_and_sign_up/signup/data/model/response/sign_up_res_model.dart';

class SignUpRepository extends BaseRepository<SignUpResModel> {
  SignUpRepository() : super(baseUrl: ApiKeys.signUp);
}
