class ApiKeys {
  ApiKeys._();
  static const String _baseUrl = "https://cleancar.az/api";

  static const String getLanguages = "$_baseUrl/getCustomerWords";
  static const String getRegions = "$_baseUrl/regions";
  static const String getBranchs = "$_baseUrl/washings";
  static const String signUp = "$_baseUrl/customerRegister";
  static const String login = "$_baseUrl/sendCustomerOtp";
  static const String verifyOTP = "$_baseUrl/customerVerifyOpt";
  static const String offers = "$_baseUrl/getCustomerOffers";
  static const String personalInfo = "$_baseUrl/profile";
  static const String cars = "$_baseUrl/cars";
  static const String banTypes = "$_baseUrl/bans";
}
