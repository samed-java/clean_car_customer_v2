import 'package:clean_car_customer_v2/constants/keys/api_keys.dart';
import 'package:clean_car_customer_v2/data/repository/base_repository.dart';

import '../model/res/notifications_res_model.dart';

class ReadNotificationsRepository extends BaseRepository<NotificationsResModel?>{
  ReadNotificationsRepository():super(baseUrl: "${ApiKeys.changeRead}/{id}");
}