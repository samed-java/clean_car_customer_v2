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
      print("data is null ");
      onDataIsNullError.call(e);
    } on NotSuccessError catch (e) {
      onNotSuccessError.call(e);
    } catch (e, s) {
      print("other");
      onOtherError.call(e, s);
    }
  }
}

class ErrorHandler with BaseErrorHandler{
  ErrorHandler(
      {required this.progressAction,
      this.dataIsNullErrorAction,
      this.socketExceptionAction,
      this.responseBodyIsNullErrorAction,
      this.notSuccessErrorAction,
      this.otherErrorAction});

  final Function progressAction;
  final Function(SocketException e)? socketExceptionAction;
  final Function(ResponseBodyIsNullError e)? responseBodyIsNullErrorAction;
  final Function(DataIsNullError e)? dataIsNullErrorAction;
  final Function(NotSuccessError e)? notSuccessErrorAction;
  final Function(Object e, StackTrace s)? otherErrorAction;

  @override
  void onProgress() {
    progressAction.call();
  }

  @override
  void onSocketException(SocketException e) {
    socketExceptionAction?.call(e);
    super.onSocketException(e);
  }

  @override
  void onDataIsNullError(DataIsNullError e) {
    dataIsNullErrorAction?.call(e);
    super.onDataIsNullError(e);
  }

  @override
  void onNotSuccessError(NotSuccessError e) {
    notSuccessErrorAction?.call(e);
    super.onNotSuccessError(e);
  }

  @override
  void onOtherError(Object e, StackTrace s) {
    otherErrorAction?.call(e,s);
    super.onOtherError(e, s);
  }

  @override
  void onResponseBodyIsNullError(ResponseBodyIsNullError e) {
    responseBodyIsNullErrorAction?.call(e);
    super.onResponseBodyIsNullError(e);
  }

}
