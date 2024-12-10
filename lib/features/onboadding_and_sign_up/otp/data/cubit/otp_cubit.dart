import 'dart:io';

import 'package:clean_car_customer_v2/data/services/local/storage_service.dart';
import 'package:clean_car_customer_v2/features/onboadding_and_sign_up/otp/data/model/request/otp_req_model.dart';
import 'package:clean_car_customer_v2/locator.dart';
import 'package:clean_car_customer_v2/utils/errors/base_error_handler.dart';
import 'package:clean_car_customer_v2/utils/errors/errors.dart';
import 'package:clean_car_customer_v2/utils/extensions/locale_extension/locale_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../utils/services/firebase/analytics/analytic_logger.dart';
import '../../../../../utils/services/firebase/firebase_service.dart';
import '../../../../../utils/services/navigation_service/navigation_service.dart';
import '../../../../../utils/snacks/snacks.dart';
import '../../../../login/data/model/req/login_req_model.dart';
import '../../../../login/data/repo/login_repository.dart';
import '../repository/otp_repository.dart';

part 'otp_state.dart';

class OTPCubit extends Cubit<OTPState> with BaseErrorHandler {
  OTPCubit() : super(OTPInitial());
  final formKey = GlobalKey<FormState>();
  final TextEditingController otpController = TextEditingController();
  final _otpRepo = locator.get<OTPRepository>();
  final StorageService _storageService = locator.get<StorageService>();

  void verify() {
    execute();
  }

  @override
  Future<void> onProgress() async {
    if (otpController.text.isNotEmpty) {
      emit(OTPLoading());
      var result = await _otpRepo.send(OtpReqModel(
          phone: _storageService.getPhoneNumber()!,
          otpToken: _storageService.getOtpToken()!,
          otpCode: int.parse(otpController.text)));
      if (result.token != null) {
        _storageService.setAccessToken(result.token);
        _storageService.setUserId(result.user.id);
        if (locator.get<StorageService>().getLangCode().isEmpty) {
          await locator.get<StorageService>().setLangCode("az");
        }
        await FirebaseService.firebaseMessaging.subscribeToTopic("customer${_storageService.getPhoneNumber()!}").then((value) => print("subscribed"));
        locator.get<EventLogger>().logLogin(data:{
          "phone":result.user.phone,
          "name":result.user.name,
        });
        emit(OTPRegistered());
      } else {
        _storageService.setPhoneNumber(result.user.phone.toString());
        emit(OTPNotRegistered());
      }
    }
  }

  @override
  void onNotSuccessError(NotSuccessError e) {
    ScaffoldMessenger.of(NavigationService.instance.context)
        .showSnackBar(const SnackBar(content: Text("Wrong otp")));
    emit(OTPFailed());
    super.onNotSuccessError(e);
  }

  @override
  void onOtherError(Object e, StackTrace s) {
    ScaffoldMessenger.of(NavigationService.instance.context).showSnackBar(
        SnackBar(
            content:
                Text(NavigationService.instance.context.locale.unknownError)));
    emit(OTPFailed());
    super.onOtherError(e, s);
  }

  @override
  void onSocketException(SocketException e) {
    ScaffoldMessenger.of(NavigationService.instance.context)
        .showSnackBar(const SnackBar(content: Text("Internet error")));
    emit(OTPFailed());
    super.onSocketException(e);
  }

  @override
  void onDataIsNullError(DataIsNullError e) {
    ScaffoldMessenger.of(NavigationService.instance.context).showSnackBar(
        SnackBar(
            content:
                Text(NavigationService.instance.context.locale.unknownError)));
    emit(OTPFailed());
    super.onDataIsNullError(e);
  }

  @override
  void onResponseBodyIsNullError(ResponseBodyIsNullError e) {
    ScaffoldMessenger.of(NavigationService.instance.context).showSnackBar(
        SnackBar(
            content:
                Text(NavigationService.instance.context.locale.unknownError)));
    emit(OTPFailed());
    super.onResponseBodyIsNullError(e);
  }

  void resendOTP(){
    ErrorHandler(
      progressAction: () async {
        var result = await locator
            .get<LoginRepository>()
            .send(LoginReqModel(phone: locator.get<StorageService>().getPhoneNumber()!.replaceAll(" ", '')));
        locator.get<StorageService>().setOtpToken(result.otpToken);
        locator.get<StorageService>().setPhoneNumber(result.phone);
      },
      otherErrorAction: (e,s){
        Snacks.showCustomSnack(message: "Unknown error occured");
    },      socketExceptionAction: (e){
        Snacks.showCustomSnack(message: "Connection error");
    }
    ).execute();
  }
}
