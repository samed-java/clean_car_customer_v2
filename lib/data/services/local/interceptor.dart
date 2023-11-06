import 'dart:developer';
import 'package:clean_car_customer_v2/data/services/local/storage_service.dart';
import 'package:dio/dio.dart';

import '../../../locator.dart';

class ClientInterceptor extends Interceptor {
  var _storage = locator.get<StorageService>();
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {


    //super.onRequest(options, handler);
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
