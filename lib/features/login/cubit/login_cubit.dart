import 'dart:io';

import 'package:clean_car_customer_v2/data/services/local/storage_service.dart';
import 'package:clean_car_customer_v2/features/login/data/model/req/login_req_model.dart';
import 'package:clean_car_customer_v2/features/login/data/repo/login_repository.dart';
import 'package:clean_car_customer_v2/locator.dart';
import 'package:clean_car_customer_v2/utils/errors/base_error_handler.dart';
import 'package:clean_car_customer_v2/utils/extensions/locale_extension/locale_extension.dart';
import 'package:clean_car_customer_v2/utils/services/firebase/analytics/analytic_logger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/services/navigation_service/navigation_service.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> with BaseErrorHandler {
  LoginCubit() : super(LoginInitial());

  final ValueNotifier<bool> isCheckedRememberMe = ValueNotifier<bool>(true);

  TextEditingController phoneController = TextEditingController(text: "994 ");
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();


  @override
  Future<void> onProgress() async {
    if(formKey.currentState!.validate()){
      emit(LoginLoading());
      var result = await locator
          .get<LoginRepository>()
          .send(LoginReqModel(phone: phoneController.text.replaceAll(" ", '')));
      locator.get<StorageService>().setOtpToken(result.otpToken);
      locator.get<StorageService>().setPhoneNumber(result.phone);
      emit(LoginSuccess());
    }
  }

  @override
  void onSocketException(SocketException e) {
    ScaffoldMessenger.of(NavigationService.instance.context)
        .showSnackBar(const SnackBar(content: Text("Internet error")));
    emit(LoginFail());
    super.onSocketException(e);
  }

  @override
  void onOtherError(Object e, StackTrace s) {
    ScaffoldMessenger.of(NavigationService.instance.context).showSnackBar(
        SnackBar(
            content:
                Text(NavigationService.instance.context.locale.unknownError)));
    emit(LoginFail());
    super.onOtherError(e, s);
  }
}
