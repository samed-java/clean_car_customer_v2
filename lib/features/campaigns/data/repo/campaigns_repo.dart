import 'package:clean_car_customer_v2/constants/keys/api_keys.dart';
import 'package:clean_car_customer_v2/data/repository/base_repository.dart';
import 'package:clean_car_customer_v2/features/campaigns/data/model/res/campaigns_res_model.dart';

class CampaignsRepository extends BaseRepository<CampaignResModel>{
  CampaignsRepository():super(baseUrl: ApiKeys.campaigns);
}