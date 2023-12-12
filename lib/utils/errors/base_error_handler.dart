import 'dart:io';

import 'errors.dart';

mixin BaseErrorHandler {
  // BaseErrorHandler(
  //     {required this.onProgress,
  //     this.onDataIsNullError,
  //     this.onSocketException,
  //     this.onResponseBodyIsNullError,
  //     this.onNotSuccessError,
  //     this.onOtherError});

  void onProgress();
  void onSocketException(SocketException e){}
  void onResponseBodyIsNullError(ResponseBodyIsNullError e){}
  void onDataIsNullError(DataIsNullError e){}
  void onNotSuccessError(NotSuccessError e){}
  void onOtherError(Object e, StackTrace s){}

  void execute() {
    try {
      onProgress.call();
    } on SocketException catch (e) {
      onSocketException.call(e);
    } on ResponseBodyIsNullError catch (e) {
      onResponseBodyIsNullError.call(e);
    } on DataIsNullError catch (e) {
      onDataIsNullError.call(e);
    } on NotSuccessError catch (e) {
      onNotSuccessError.call(e);
    } catch (e, s) {
      onOtherError.call(e, s);
    }
  }
}
