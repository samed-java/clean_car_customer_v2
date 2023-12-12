import 'package:clean_car_customer_v2/data/model/request/base_request_model.dart';
import 'package:clean_car_customer_v2/utils/errors/errors.dart';
import 'package:flutter/cupertino.dart';

import '../../locator.dart';
import '../model/response/base_response_model.dart';
import '../services/remote/global_service.dart';

abstract class BaseRepository<T> {
  @protected
  final String baseUrl;
  BaseRepository({required this.baseUrl});

  Future<T> send(BaseRequestModel body) async {
    BaseResponseModel<T> result =
        await locator.get<GlobalService>().sendData<T>(baseUrl, body);
    if (result != null) {
      if (result.success ?? false) {
        if (result.data != null) {
          return result.data!;
        } else {
          throw DataIsNullError(
              message: "Data returned null from request $baseUrl");
        }
      } else {
        throw NotSuccessError(
            message: "Request result is not success from request $baseUrl");
      }
    } else {
      throw ResponseBodyIsNullError(
          message: "Response body is null from request $baseUrl");
    }
  }

  Future<T?> fetch({BaseRequestModel? queryParameters}) async {
    BaseResponseModel<T> result = await locator
        .get<GlobalService>()
        .fetchData<T>(baseUrl, queryParameters);
    return result.data;
  }
}
