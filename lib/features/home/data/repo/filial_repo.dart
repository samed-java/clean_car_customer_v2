import 'package:clean_car_customer_v2/constants/keys/api_keys.dart';
import 'package:clean_car_customer_v2/data/repository/base_repository.dart';
import 'package:clean_car_customer_v2/features/home/data/model/res/branchs_res_model.dart';

import '../model/res/regions_res_model.dart';

class BranchsRepository extends BaseRepository<BranchsResModel> {
  BranchsRepository() : super(baseUrl: ApiKeys.getBranchs);
}
