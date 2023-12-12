import 'dart:io';

import 'package:clean_car_customer_v2/data/services/local/storage_service.dart';
import 'package:clean_car_customer_v2/features/onboadding_and_sign_up/signup/data/model/request/sign_up_req_model.dart';
import 'package:clean_car_customer_v2/features/onboadding_and_sign_up/signup/data/repository/sign_up_repository.dart';
import 'package:clean_car_customer_v2/locator.dart';
import 'package:clean_car_customer_v2/utils/errors/base_error_handler.dart';
import 'package:clean_car_customer_v2/utils/errors/errors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> with BaseErrorHandler{
  SignUpCubit() : super(SignUpInitial());
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final _signUpRepo = locator.get<SignUpRepository>();
  final StorageService _storageService = locator.get<StorageService>();
  ValueNotifier<bool> isCheckedRememberMe = ValueNotifier<bool>(false);

  void signUp() {
    // BaseErrorHandler(
    //     onProgress: () async {
    //   if (formKey.currentState!.validate() && isCheckedRememberMe.value) {
    //     emit(SignUpLoading());
    //     var result = await _signUpRepo.send(SignUpReqModel(
    //         phone: numberController.text,
    //         name: nameController.text,
    //         email: emailController.text));
    //     if (result.token != null) {
    //       _storageService.setAccessToken(result.token);
    //       emit(SignUpRegistered());
    //     } else {
    //       _storageService.setPhoneNumber(result.user.phone.toString());
    //       emit(SignUpNotRegistered());
    //     }
    //   }
    // }
    // ).
    execute();
  }

  @override
  void onDataIsNullError(DataIsNullError e) {
    // TODO: implement onDataIsNullError
  }

  @override
  void onNotSuccessError(NotSuccessError e) {
    // TODO: implement onNotSuccessError
  }

  @override
  void onOtherError(Object e, StackTrace s) {
    // TODO: implement onOtherError
  }

  @override
  void onProgress() async  {
    if (formKey.currentState!.validate() && isCheckedRememberMe.value) {
      emit(SignUpLoading());
      var result = await _signUpRepo.send(SignUpReqModel(
          phone: numberController.text,
          name: nameController.text,
          email: emailController.text));
      if (result.token != null) {
        _storageService.setAccessToken(result.token);
        emit(SignUpRegistered());
      } else {
        _storageService.setPhoneNumber(result.user.phone.toString());
        emit(SignUpNotRegistered());
      }
    }
  }

  @override
  void onResponseBodyIsNullError(ResponseBodyIsNullError e) {
    // TODO: implement onResponseBodyIsNullError
  }

  @override
  void onSocketException(SocketException e) {
    // TODO: implement onSocketException
  }
}
