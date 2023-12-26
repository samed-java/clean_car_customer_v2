import 'dart:io';

import 'package:clean_car_customer_v2/features/profile_section/personal_info/data/repo/profile_info_repository.dart';
import 'package:clean_car_customer_v2/locator.dart';
import 'package:clean_car_customer_v2/utils/errors/base_error_handler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clean_car_customer_v2/features/profile_section/personal_info/cubit/profile_info/profile_info_state.dart';

class ProfileInfoCubit extends Cubit<ProfileInfoState> with BaseErrorHandler{
	ProfileInfoCubit() : super(ProfileInfoInitial());

  @override
  void onProgress() async {
    emit(ProfileInfoLoading());
		var result = await locator.get<ProfileInfoRepository>().fetch();
    if(result!=null){
      emit(ProfileInfoSuccess(result));
    }else{
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
}
