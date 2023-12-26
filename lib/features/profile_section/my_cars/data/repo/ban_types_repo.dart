import 'package:clean_car_customer_v2/features/profile_section/my_cars/data/model/res/ban_types_res_model.dart';

import '../../../../../constants/keys/api_keys.dart';
import '../../../../../data/repository/base_repository.dart';

class BanTypesRepository extends BaseRepository<BanTypesResModel>{
  BanTypesRepository():super(baseUrl: ApiKeys.banTypes);
}