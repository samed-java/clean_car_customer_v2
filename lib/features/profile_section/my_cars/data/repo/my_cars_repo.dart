import 'package:clean_car_customer_v2/constants/keys/api_keys.dart';
import 'package:clean_car_customer_v2/data/repository/base_repository.dart';
import 'package:clean_car_customer_v2/features/profile_section/my_cars/data/model/req/add_cars_req_model.dart';
import 'package:clean_car_customer_v2/features/profile_section/my_cars/data/model/res/my_cars_res_model.dart';

class MyCarsRepository extends BaseRepository<CarsResModel> {
  MyCarsRepository() : super(baseUrl: "${ApiKeys.cars}/{id}");

  Future<void> updateCar({required AddCarsReqModel data, required int id}) async{
    await super.update(data, path: {"id": id});
  }

  Future<void> addCar({required AddCarsReqModel data}) async{
    await super.send(data);
  }

  Future<void> deleteCar({required int id}) async{
    await super.delete( path: {"id": id});
  }
}
