import 'package:clean_car_customer_v2/constants/keys/api_keys.dart';
import 'package:clean_car_customer_v2/features/profile_section/personal_info/data/model/res/profile_info_res_model.dart';

import '../../../../../data/repository/base_repository.dart';

class ProfileInfoRepository extends BaseRepository<ProfileInfoResModel>{
  ProfileInfoRepository():super(baseUrl: ApiKeys.personalInfo);
  
}