import 'dart:io';

import 'errors.dart';

class BaseErrorHandler {
  BaseErrorHandler(
      {required this.onProgress,
      this.onDataIsNullError,
      this.onSocketException,
      this.onResponseBodyIsNullError,
      this.onNotSuccessError,
      this.onOtherError});

  final void Function() onProgress;
  final void Function(SocketException e)? onSocketException;
  final void Function(ResponseBodyIsNullError e)? onResponseBodyIsNullError;
  final void Function(DataIsNullError e)? onDataIsNullError;
  final void Function(NotSuccessError e)? onNotSuccessError;
  final void Function(Object e, StackTrace s)? onOtherError;

  void execute() {
    try {
      onProgress.call();
    } on SocketException catch (e) {
      onSocketException?.call(e);
    } on ResponseBodyIsNullError catch (e) {
      onResponseBodyIsNullError?.call(e);
    } on DataIsNullError catch (e) {
      onDataIsNullError?.call(e);
    } on NotSuccessError catch (e) {
      onNotSuccessError?.call(e);
    } catch (e, s) {
      onOtherError?.call(e, s);
    }
  }
}
