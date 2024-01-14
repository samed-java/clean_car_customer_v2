import 'dart:io';

import 'package:clean_car_customer_v2/features/profile_section/personal_info/data/model/req/edit_profile_req_model.dart';
import 'package:clean_car_customer_v2/features/profile_section/personal_info/data/repo/profile_info_repository.dart';
import 'package:clean_car_customer_v2/locator.dart';
import 'package:clean_car_customer_v2/utils/errors/base_error_handler.dart';
import 'package:clean_car_customer_v2/utils/errors/errors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clean_car_customer_v2/features/profile_section/personal_info/cubit/profile_info/profile_info_state.dart';

import '../../../../../data/services/local/storage_service.dart';
import '../../../../../utils/pager/go.dart';
import '../../../../../utils/pager/pager.dart';

class ProfileInfoCubit extends Cubit<ProfileInfoState> with BaseErrorHandler {
  ProfileInfoCubit() : super(ProfileInfoInitial());

  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();

  @override
  Future<void> onProgress() async {
    emit(ProfileInfoLoading());
    var result = await locator.get<ProfileInfoRepository>().fetch();
    if (result != null) {
      name.text = result.user.name;
      email.text = result.user.email;
      phone.text = result.user.phone.toString();
      emit(ProfileInfoSuccess(result));
    } else {
      emit(ProfileInfoErrorState("No data"));
    }
  }

  @override
  void onSocketException(SocketException e) {
    emit(ProfileInfoErrorState("Network error"));
    super.onSocketException(e);
  }

  @override
  void onOtherError(Object e, StackTrace s) {
    emit(ProfileInfoErrorState("Unhandled exception"));
    super.onOtherError(e, s);
  }

  void updateData() async {
    print("saaalaaaam");
    ErrorHandler(progressAction: () async {
      print("saaalaaaamlaaar");
      await locator.get<ProfileInfoRepository>().update(EditProfileReqModel(
          name: name.text, email: email.text, phone: phone.text));
      Go.back();
    }, socketExceptionAction: (SocketException e) {
      print(e.message);
    }, otherErrorAction: (e, s) {
      print(e);
      print(s);
    }, dataIsNullErrorAction: (e) {
      print(e.message);
    }, responseBodyIsNullErrorAction: (e) {
      print(e.message);
    }, notSuccessErrorAction: (e) {
      print(e.message);
    }).execute();
  }

  void deleteAccount() async {
    ErrorHandler(progressAction: () async {
      await locator.get<ProfileInfoRepository>().delete();
    }, socketExceptionAction: (SocketException e) {
      print(e.message);
    }, otherErrorAction: (e, s) {
      print(e);
      print(s);
    }, dataIsNullErrorAction: (DataIsNullError e) async {
      await locator.get<StorageService>().instance.erase();
      Go.removeUntillAndGo(Pager.splashBegin);
    }).execute();
  }
}
