import 'package:clean_car_customer_v2/constants/keys/api_keys.dart';
import 'package:clean_car_customer_v2/data/repository/base_repository.dart';
import 'package:clean_car_customer_v2/features/branches_and_reservation/reservation/data/model/res/reservation_submit_res_model.dart';

class ReservationSubmitRepo extends BaseRepository<ReservationSubmitResModel>{
  ReservationSubmitRepo():super(baseUrl: ApiKeys.reserve);
}