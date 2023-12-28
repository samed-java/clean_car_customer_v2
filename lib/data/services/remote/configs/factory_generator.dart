import 'package:clean_car_customer_v2/features/home/data/model/res/branchs_res_model.dart';

import '../../../../features/branches_and_reservation/reservation/data/model/res/reservation_parameters_res_model.dart';
import '../../../../features/home/data/model/res/regions_res_model.dart';
import '../../../../features/login/data/model/res/login_res_model.dart';
import '../../../../features/offers/data/model/res/offers_res_model.dart';
import '../../../../features/onboadding_and_sign_up/signup/data/model/response/sign_up_res_model.dart';
import '../../../../features/profile_section/my_cars/data/model/res/ban_types_res_model.dart';
import '../../../../features/profile_section/my_cars/data/model/res/my_cars_res_model.dart';
import '../../../../features/profile_section/personal_info/data/model/res/profile_info_res_model.dart';
import '../../../../utils/language/data/model/response/language_response_model.dart';

class FactoryGenerator {
  FactoryGenerator._();

  static final Map<Type, Function> _factoryGenerator = {
    LanguageResponseModel: (json) => LanguageResponseModel.fromJson(json),
    SignUpResModel: (json) => SignUpResModel.fromJson(json),
    OfferResModel: (json) => OfferResModel.fromJson(json),
    RegionResModel: (json) => RegionResModel.fromJson(json),
    LoginResModel: (json) => LoginResModel.fromJson(json),
    BranchsResModel: (json) => BranchsResModel.fromJson(json),
    ProfileInfoResModel: (json) => ProfileInfoResModel.fromJson(json),
    CarsResModel: (json) => CarsResModel.fromJson(json),
    BanTypesResModel: (json) => BanTypesResModel.fromJson(json),
    ReservationParametersResModel: (json) => ReservationParametersResModel.fromJson(json),
  };

  static T createObject<T>(Map<String, dynamic> body) {
    if (_factoryGenerator.containsKey(T)) {
      return _factoryGenerator[T]!.call(body);
    } else {
      throw Exception(
          "Model $T not added to _factoryGenerator map class FactoryGenerator in lib/data/services/remote/configs/factory_generator.dart");
    }
  }
}
