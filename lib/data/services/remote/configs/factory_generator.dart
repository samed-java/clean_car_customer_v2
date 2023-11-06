

class FactoryGenerator {
  FactoryGenerator._();

  static final Map<Type, Function> _factoryGenerator = {
    // OnboardingDataModel: (json) => OnboardingDataModel.fromJson(json),
    // LoginResModel: (json) => LoginResModel.fromJson(json),
    // SignUpResModel: (json) => SignUpResModel.fromJson(json),
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
