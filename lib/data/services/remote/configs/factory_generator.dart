import '../../../../features/offers/data/model/res/offers_res_model.dart';
import '../../../../features/onboadding_and_sign_up/signup/data/model/response/sign_up_res_model.dart';
import '../../../../utils/language/data/model/response/language_response_model.dart';
import '../../../../features/branches_and_reservation/data/model/res/regions_res_model.dart';

class FactoryGenerator {
  FactoryGenerator._();

  static final Map<Type, Function> _factoryGenerator = {
    LanguageResponseModel: (json) => LanguageResponseModel.fromJson(json),
    // LoginResModel: (json) => LoginResModel.fromJson(json),
    SignUpResModel: (json) => SignUpResModel.fromJson(json),
    OfferResModel: (json) => OfferResModel.fromJson(json),
    RegionResModel: (json) => RegionResModel.fromJson(json),

    // OtpResModel: (json) => OtpResModel.fromJson(json),
    // ForgotPassResModel: (json) => ForgotPassResModel.fromJson(json),
    // NewPassResModel: (json) => NewPassResModel.fromJson(json)
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
