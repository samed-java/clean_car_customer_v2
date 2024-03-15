import 'package:clean_car_customer_v2/constants/keys/api_keys.dart';
import 'package:clean_car_customer_v2/data/repository/base_repository.dart';
import 'package:clean_car_customer_v2/features/profile_section/settings/features/faq/data/model/faq_res_model.dart';

class FaqRepository extends BaseRepository<FaqResModel> {
  FaqRepository() : super(baseUrl: ApiKeys.faqs);
}
