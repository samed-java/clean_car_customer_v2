import 'package:clean_car_customer_v2/constants/keys/api_keys.dart';
import 'package:clean_car_customer_v2/data/repository/base_repository.dart';
import '../../../signup/data/model/response/sign_up_res_model.dart';

class OTPRepository extends BaseRepository<SignUpResModel>{
  OTPRepository():super(baseUrl: ApiKeys.verifyOTP);
}