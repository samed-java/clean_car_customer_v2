import 'dart:io';

import 'package:clean_car_customer_v2/data/services/local/storage_service.dart';
import 'package:clean_car_customer_v2/features/login/data/model/req/login_req_model.dart';
import 'package:clean_car_customer_v2/features/login/data/repo/login_repository.dart';
import 'package:clean_car_customer_v2/locator.dart';
import 'package:clean_car_customer_v2/utils/errors/base_error_handler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> with BaseErrorHandler{
  LoginCubit() : super(LoginInitial());

  TextEditingController phoneController =  TextEditingController(text: "994 ");

  @override
  Future<void> onProgress() async {
    emit(LoginLoading());
    var result = await locator.get<LoginRepository>().send(LoginReqModel(phone: phoneController.text.replaceAll(" ", '')));
    locator.get<StorageService>().setOtpToken(result.otpToken);
    locator.get<StorageService>().setPhoneNumber(result.phone);
    emit(LoginSuccess());
  }

  @override
  void onSocketException(SocketException e) {
    emit(LoginFail());
    super.onSocketException(e);
  }

  @override
  void onOtherError(Object e, StackTrace s) {
    emit(LoginFail());
    super.onOtherError(e, s);
  }
}
