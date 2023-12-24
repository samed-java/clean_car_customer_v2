import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:clean_car_customer_v2/features/branches_and_reservation/data/model/res/regions_res_model.dart';
import 'package:clean_car_customer_v2/features/branches_and_reservation/data/repo/regions_repo.dart';
import 'package:clean_car_customer_v2/locator.dart';
import 'package:clean_car_customer_v2/utils/errors/base_error_handler.dart';
// import 'package:meta/meta.dart';

part 'regions_state.dart';

class RegionsCubit extends Cubit<RegionsState> with BaseErrorHandler {
  RegionsCubit() : super(RegionsInitial());

  @override
  void execute() {
    super.execute();
  }

  @override
  void onProgress() async {
    emit(RegionsLoading());
    var result = await locator.get<RegionsRepository>().fetch();
    print(result);
    emit(RegionsSuccess(data: result));
  }

  @override
  void onSocketException(SocketException e) {
    emit(RegionsFail(message: "Check connection"));
  }

  @override
  void onOtherError(Object e, StackTrace s) {
    RegionsFail(message: "Unknown Error");
  }
}
