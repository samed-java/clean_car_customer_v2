import 'dart:core';
import 'error_codes.dart';

class ResponseBodyIsNullError implements Exception {
  ResponseBodyIsNullError({required this.message})
      : code = ErrorCodes.RESPONSE_BODY_IS_NULL.code;
  final String message;
  final String code;
}

class DataIsNullError implements Exception {
  DataIsNullError({required this.message}):code = ErrorCodes.DATA_IS_NULL.code, super();
  final String message;
  final String code;

  @override
  // TODO: implement stackTrace
  StackTrace? get stackTrace => null;
}
class NotSuccessError implements Exception {
  NotSuccessError({required this.message})
      : code = ErrorCodes.NOT_SUCCESS.code;
  final String message;
  final String code;
}
