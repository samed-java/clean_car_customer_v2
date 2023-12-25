import 'dart:io';

import 'package:clean_car_customer_v2/data/services/local/storage_service.dart';
import 'package:clean_car_customer_v2/features/onboadding_and_sign_up/otp/data/model/request/otp_req_model.dart';
import 'package:clean_car_customer_v2/locator.dart';
import 'package:clean_car_customer_v2/utils/errors/base_error_handler.dart';
import 'package:clean_car_customer_v2/utils/errors/errors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repository/otp_repository.dart';

part 'otp_state.dart';

class OTPCubit extends Cubit<OTPState> with BaseErrorHandler{
  OTPCubit() : super(OTPInitial());
  final formKey = GlobalKey<FormState>();
  final TextEditingController otpController = TextEditingController();
  final _otpRepo = locator.get<OTPRepository>();
  final StorageService _storageService = locator.get<StorageService>();

  void verify() {
    execute();
  }


  @override
  void onProgress() async {
    if (otpController.text.isNotEmpty) {
      emit(OTPLoading());
      var result = await _otpRepo.send(OtpReqModel(
          phone: _storageService.getPhoneNumber()!,
          otpToken: _storageService.getOtpToken()!,
          otpCode: int.parse(otpController.text)
      ));
      if (result.token != null) {
        _storageService.setAccessToken(result.token);
        emit(OTPRegistered());
      } else {
        _storageService.setPhoneNumber(result.user.phone.toString());
        emit(OTPNotRegistered());
      }
    }
  }

}
