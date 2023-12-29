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

  String _pathConverter(String baseUrl, Map<String, dynamic>? path) {
    var pathKeys = path?.keys ?? [];
    var newUrl = baseUrl;
    for (var i in pathKeys) {
      newUrl =
          newUrl.replaceAll("/{$i}", (path?[i]) != null ? "/${path![i]}" : "");
    }
    var splitUrl = newUrl.split("/");
    splitUrl.removeWhere(
        (element) => element.contains("{") && element.contains("}"));
    newUrl = splitUrl.join("/");
    return newUrl;
  }

  Future<T> send(BaseRequestModel body, {Map<String, dynamic>? path}) async {
    String convertedUrl = _pathConverter(baseUrl, path);
    BaseResponseModel<T> result =
        await locator.get<GlobalService>().sendData<T>(convertedUrl, body);
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

  Future<T> update(BaseRequestModel body, {Map<String, dynamic>? path}) async {
    String convertedUrl = _pathConverter(baseUrl, path);
    BaseResponseModel<T> result =
        await locator.get<GlobalService>().putData<T>(convertedUrl, body);
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

  Future<T> fetch(
      {BaseRequestModel? queryParameters, Map<String, dynamic>? path}) async {
    String convertedUrl = _pathConverter(baseUrl, path);
    print('converted Url: $convertedUrl');
    BaseResponseModel<T> result = await locator
        .get<GlobalService>()
        .fetchData<T>(convertedUrl, queryParameters);
    print('result: $result');
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

  Future<T> delete(
      {BaseRequestModel? queryParameters, Map<String, dynamic>? path}) async {
    String convertedUrl = _pathConverter(baseUrl, path);
    BaseResponseModel<T?> result = await locator
        .get<GlobalService>()
        .deleteData<T>(convertedUrl, queryParameters);
    if (result != null) {
      if (result.success ?? false) {
        if (result.data != null) {
          return result.data!;
        } else {
          print('data null');
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
}
