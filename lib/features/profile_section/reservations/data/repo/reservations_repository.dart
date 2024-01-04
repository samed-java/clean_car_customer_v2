import 'package:clean_car_customer_v2/constants/keys/api_keys.dart';
import 'package:clean_car_customer_v2/data/repository/base_repository.dart';
import 'package:clean_car_customer_v2/features/profile_section/reservations/data/model/reservations_model.dart';

class ReservationsRepository extends BaseRepository<ReservationsResModel> {
  ReservationsRepository() : super(baseUrl: ApiKeys.reservationList);
}
