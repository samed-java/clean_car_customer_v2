import 'dart:io';
import 'package:clean_car_customer_v2/features/home/data/model/res/branchs_res_model.dart';
import 'package:clean_car_customer_v2/features/home/data/repo/filial_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clean_car_customer_v2/locator.dart';
import 'package:clean_car_customer_v2/utils/errors/base_error_handler.dart';
// import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> with BaseErrorHandler {
  HomeCubit() : super(HomeInitial());


  @override
  Future<void> onProgress() async {
    emit(HomeLoading());
    var result = await locator.get<BranchsRepository>().fetch();
    emit(HomeSuccess(data: result));
  }

  @override
  void onSocketException(SocketException e) {
    emit(HomeFail(message: "Check connection"));
  }

  @override
  void onOtherError(Object e, StackTrace s) {
    HomeFail(message: "Unknown Error");
  }
}


