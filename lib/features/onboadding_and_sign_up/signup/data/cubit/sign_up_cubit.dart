import 'dart:io';

import 'package:clean_car_customer_v2/data/services/local/storage_service.dart';
import 'package:clean_car_customer_v2/features/login/cubit/login_cubit.dart';
import 'package:clean_car_customer_v2/features/onboadding_and_sign_up/signup/data/model/request/sign_up_req_model.dart';
import 'package:clean_car_customer_v2/features/onboadding_and_sign_up/signup/data/model/response/terms_res_model.dart';
import 'package:clean_car_customer_v2/features/onboadding_and_sign_up/signup/data/repository/sign_up_repository.dart';
import 'package:clean_car_customer_v2/locator.dart';
import 'package:clean_car_customer_v2/utils/errors/base_error_handler.dart';
import 'package:clean_car_customer_v2/utils/errors/errors.dart';
import 'package:clean_car_customer_v2/utils/extensions/locale_extension/locale_extension.dart';
import 'package:clean_car_customer_v2/utils/services/navigation_service/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../../utils/services/firebase/analytics/analytic_logger.dart';
import '../repository/terms_repository.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> with BaseErrorHandler {
  SignUpCubit() : super(SignUpInitial()) {
    isCheckedRememberMe = ValueNotifier<bool>(_storageService.getTerms());
    isCheckedRememberMe.addListener(() {
      _storageService.setTerms(isCheckedRememberMe.value);
    });
  }
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final _signUpRepo = locator.get<SignUpRepository>();
  final _termsConditionsRepo = locator.get<TermsRepository>();
  final StorageService _storageService = locator.get<StorageService>();
  late ValueNotifier<bool> isCheckedRememberMe;
  BehaviorSubject<TermsResModel> terms = BehaviorSubject<TermsResModel>();

  void init() {
    ErrorHandler(progressAction: () async {
      terms.value = await _termsConditionsRepo.fetch();
    }, socketExceptionAction: (e) {
      ScaffoldMessenger.of(NavigationService.instance.context)
          .showSnackBar(SnackBar(content: Text("Internet error")));
    }).execute();
  }

  void signUp() {
    execute();
  }

  @override
  void onDataIsNullError(DataIsNullError e) {
    ScaffoldMessenger.of(NavigationService.instance.context).showSnackBar(
        SnackBar(
            content:
                Text(NavigationService.instance.context.locale.unknownError)));
    emit(SignUpFailed());
  }

  @override
  void onNotSuccessError(NotSuccessError e) {
    ScaffoldMessenger.of(NavigationService.instance.context).showSnackBar(
        SnackBar(
            content:
                Text(NavigationService.instance.context.locale.unknownError)));
    emit(SignUpFailed());
  }

  @override
  void onOtherError(Object e, StackTrace s) {
    ScaffoldMessenger.of(NavigationService.instance.context).showSnackBar(
        SnackBar(
            content:
                Text(NavigationService.instance.context.locale.unknownError)));
    emit(SignUpFailed());
  }

  @override
  Future<void> onProgress() async {
    if (formKey.currentState!.validate() && isCheckedRememberMe.value) {
      emit(SignUpLoading());
      var result = await _signUpRepo.send(SignUpReqModel(
          phone: _storageService.getPhoneNumber()!,
          name: nameController.text,
          email: emailController.text));
      if (result.token != null) {
        _storageService.setAccessToken(result.token);
        locator.get<EventLogger>().logSignUp(data:{
          "phone":result.user.phone,
          "name":result.user.name,
          "email":result.user.email
        });
        emit(SignUpRegistered());
      }
      // else {
      //   _storageService.setPhoneNumber(result.user.phone.toString());
      //   emit(SignUpNotRegistered());
      // }
    }
  }

  @override
  void onResponseBodyIsNullError(ResponseBodyIsNullError e) {
    ScaffoldMessenger.of(NavigationService.instance.context).showSnackBar(
        SnackBar(
            content:
                Text(NavigationService.instance.context.locale.unknownError)));
    emit(SignUpFailed());
  }

  @override
  void onSocketException(SocketException e) {
    ScaffoldMessenger.of(NavigationService.instance.context)
        .showSnackBar(SnackBar(content: Text("Internet error")));
    emit(SignUpFailed());
  }
}
