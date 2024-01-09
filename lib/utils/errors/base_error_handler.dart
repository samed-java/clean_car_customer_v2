import 'dart:io';
import 'errors.dart';

mixin BaseErrorHandler {
  Future<void> onProgress();
  void onSocketException(SocketException e) {}
  void onResponseBodyIsNullError(ResponseBodyIsNullError e) {}
  void onDataIsNullError(DataIsNullError e) {}
  void onNotSuccessError(NotSuccessError e) {}
  void onOtherError(Object e, StackTrace s) {}

  void execute() async {
    try {
      await onProgress.call();
    } on SocketException catch (e) {
      onSocketException.call(e);
    } catch (e, s) {
      if (e is DataIsNullError) {
        print(e.message);
        onDataIsNullError.call(e);
      } else if (e is ResponseBodyIsNullError) {
        print(e.message);
        onResponseBodyIsNullError.call(e);
      } else if (e is NotSuccessError) {
        print(e.message);
        onNotSuccessError.call(e);
      } else {
        print(e);
        print(s);
        onOtherError.call(e, s);
      }
    }
  }
}

class ErrorHandler with BaseErrorHandler {
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
  Future<void> onProgress() async {
    await progressAction.call();
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
    otherErrorAction?.call(e, s);
    super.onOtherError(e, s);
  }

  @override
  void onResponseBodyIsNullError(ResponseBodyIsNullError e) {
    responseBodyIsNullErrorAction?.call(e);
    super.onResponseBodyIsNullError(e);
  }
}
