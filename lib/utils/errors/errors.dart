import 'package:clean_car_customer_v2/utils/errors/error_codes.dart';

class ResponseBodyIsNullError extends Error {
  ResponseBodyIsNullError({required this.message})
      : code = ErrorCodes.RESPONSE_BODY_IS_NULL.code;
  final String message;
  final String code;
}

class DataIsNullError extends Error {
  DataIsNullError({required this.message})
      : code = ErrorCodes.DATA_IS_NULL.code;
  final String message;
  final String code;
}
class NotSuccessError extends Error {
  NotSuccessError({required this.message})
      : code = ErrorCodes.NOT_SUCCESS.code;
  final String message;
  final String code;
}
