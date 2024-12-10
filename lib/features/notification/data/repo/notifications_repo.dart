import 'package:clean_car_customer_v2/constants/keys/api_keys.dart';
import 'package:clean_car_customer_v2/data/repository/base_repository.dart';

import '../model/res/notifications_res_model.dart';

class NotificationsRepository extends BaseRepository<NotificationsResModel>{
  NotificationsRepository():super(baseUrl: ApiKeys.notifications);
}