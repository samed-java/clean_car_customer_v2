import 'package:dio/dio.dart';

import '../../../locator.dart';
import '../../model/request/base_request_model.dart';
import '../../model/response/base_response_model.dart';
import 'configs/factory_generator.dart';

class GlobalService {
  final Dio _service = locator.get<Dio>();

  Future<BaseResponseModel<T>> sendData<T>(
      String baseUrl, BaseRequestModel body) async {
    print(body.toJson());
    print(baseUrl);
    var response = await _service.post(baseUrl, data: body.toJson());

    if (response.statusCode! >= 200 && response.statusCode! < 400) {
      if (response.data["error"] == null) {
        return BaseResponseModel<T>(
          success: response.data["success"],
          message: response.data["message"],
          data: FactoryGenerator.createObject<T>(response.data["data"]),
        );
      } else {
        throw Exception(Error.fromJson(response.data["error"]).message);
      }
    } else {
      throw Exception("Error with status code ${response.statusCode}");
    }
  }

  Future<BaseResponseModel<T>> putData<T>(
      String baseUrl, BaseRequestModel body) async {
    print(body.toJson());
    print(baseUrl);
    var response = await _service.put(baseUrl, data: body.toJson());

    if (response.statusCode! >= 200 && response.statusCode! < 400) {
      if (response.data["error"] == null) {
        return BaseResponseModel<T>(
          success: response.data["success"],
          message: response.data["message"],
          data: FactoryGenerator.createObject<T>(response.data["data"]),
        );
      } else {
        throw Exception(Error.fromJson(response.data["error"]).message);
      }
    } else {
      throw Exception("Error with status code ${response.statusCode}");
    }
  }



  Future<BaseResponseModel<T>> fetchData<T>(String baseUrl,
      [BaseRequestModel? body]) async {
    print(baseUrl);
    var response = await _service.get(baseUrl, queryParameters: body?.toJson());
    print(response.data);
    if (response.statusCode! >= 200 && response.statusCode! < 400) {
      if (response.data["error"] == null) {
        return BaseResponseModel<T>(
          success: response.data["success"],
          message: response.data["message"],
          data: FactoryGenerator.createObject<T>(response.data["data"]),
        );
      } else {
        throw Exception(Error.fromJson(response.data["error"]).message);
      }
    } else {
      throw Exception("Error with status code ${response.statusCode}");
    }
  }

  Future<BaseResponseModel<T?>> deleteData<T>(String baseUrl,
      [BaseRequestModel? body]) async {
    print(baseUrl);
    var response = await _service.delete(baseUrl, queryParameters: body?.toJson());
    print(response.data);
    if (response.statusCode! >= 200 && response.statusCode! < 400) {
      if (response.data["error"] == null) {
        return BaseResponseModel<T>(
          success: response.data["success"],
          message: response.data["message"],
          data:response.data["data"]!=null? FactoryGenerator.createObject<T>(response.data["data"]):null,
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
