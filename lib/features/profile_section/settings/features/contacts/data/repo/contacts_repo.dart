import 'package:clean_car_customer_v2/constants/keys/api_keys.dart';
import 'package:clean_car_customer_v2/data/repository/base_repository.dart';
import 'package:clean_car_customer_v2/features/profile_section/settings/features/contacts/data/model/res/contacts_res_model.dart';

class ContacsRepository extends BaseRepository<ContactsResModel>{
  ContacsRepository():super(baseUrl: ApiKeys.contacts);
}