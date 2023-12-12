class ApiKeys {
  ApiKeys._();
  static const String _baseUrl = "https://cleancar.az/api";

  static const String getLanguages = "$_baseUrl/getCustomerWords";
  static const String getRegions = "$_baseUrl/regions";
  static const String signUp = "$_baseUrl/customerRegister";
  static const String verifyOTP = "$_baseUrl/customerVerifyOpt";
}
