import 'package:clean_car_customer_v2/constants/keys/api_keys.dart';
import 'package:clean_car_customer_v2/data/repository/base_repository.dart';
import 'package:clean_car_customer_v2/features/branches_and_reservation/reservation/data/model/res/reservation_parameters_res_model.dart';

class ReservationParametersRepository extends BaseRepository<ReservationParametersResModel>{
  ReservationParametersRepository():super(baseUrl: ApiKeys.getWashingServices);
}