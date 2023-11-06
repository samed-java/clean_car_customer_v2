import 'dart:convert';


import 'package:dio/dio.dart';

import '../../../constants/keys/api_keys.dart';
import '../../../locator.dart';
import '../../model/request/base_request_model.dart';
import '../../model/response/base_response_model.dart';
import 'configs/factory_generator.dart';

class GlobalService {
  final Dio _service = locator.get<Dio>();

  Future<BaseResponseModel<T>> getData<T>(BaseRequestModel body) async {
    print(body.toJson());
    var response = await _service.post(ApiKeys.baseUrl, data: body.toJson());

    if (response.statusCode! >= 200 && response.statusCode! < 400) {
      if (response.data["error"] == null) {
        return BaseResponseModel<T>(
          result: response.data["result"],
          error: response.data["error"] != null
              ? Error.fromJson(response.data["error"])
              : null,
          data: FactoryGenerator.createObject<T>(response.data["data"]),
        );
      } else {
        throw Exception(Error.fromJson(response.data["error"]).message);
      }
    } else {
      throw Exception("Error with status code ${response.statusCode}");
    }
  }
  //
  // Future<BaseResponseModel<List<T>>> getListOfData<T>(
  //     BaseRequestModel body) async {
  //   var response = await _service.post(ApiKeys.baseUrl, data: body.toJson());
  //
  //   if (response.statusCode! >= 200 && response.statusCode! < 400) {
  //     if (response.data["error"] == null) {
  //       return BaseResponseModel<List<T>>(
  //         result: response.data["result"],
  //         error: response.data["error"] != null
  //             ? Error.fromJson(response.data["error"])
  //             : null,
  //         data: response.data["data"]
  //             .map<T>((data) => FactoryGenerator.createObject<T>(data))
  //             .toList(),
  //       );
  //     } else {
  //       throw Exception(Error.fromJson(response.data["error"]).message);
  //     }
  //   } else {
  //     throw Exception("Error with status code ${response.statusCode}");
  //   }
  // }
}
