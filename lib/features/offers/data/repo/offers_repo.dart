import 'package:clean_car_customer_v2/constants/keys/api_keys.dart';
import 'package:clean_car_customer_v2/data/repository/base_repository.dart';
import 'package:clean_car_customer_v2/features/offers/data/model/res/offers_res_model.dart';

class OffersRepository extends BaseRepository<OfferResModel>{
  OffersRepository():super(baseUrl: ApiKeys.offers);
}