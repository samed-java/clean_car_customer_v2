import 'package:clean_car_customer_v2/constants/keys/api_keys.dart';
import 'package:clean_car_customer_v2/data/repository/base_repository.dart';
import '../model/response/terms_res_model.dart';

class TermsRepository extends BaseRepository<TermsResModel> {
  TermsRepository() : super(baseUrl: ApiKeys.terms);
}
