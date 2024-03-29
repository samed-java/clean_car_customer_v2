import 'dart:developer';
import 'package:clean_car_customer_v2/data/services/local/storage_service.dart';
import 'package:dio/dio.dart';

import '../../../locator.dart';

class ClientInterceptor extends Interceptor {
  var _storage = locator.get<StorageService>();
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    String? token = locator.get<StorageService>().getAccessToken();
    String lang = locator.get<StorageService>().getLangCode();
    if (token != null) {
      print(token);
      print(options.uri);
      print(lang);
      //Position position = await Geolocator.getCurrentPosition();
      options.headers['Authorization'] = "Bearer $token";
      options.headers['Accept-Language'] = lang;
      // options.headers['lat'] = "${position.latitude}";
      // options.headers['lon'] = "${position.longitude}";
    }
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
    log(response.toString());
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);
    log(err.toString());
  }
}
