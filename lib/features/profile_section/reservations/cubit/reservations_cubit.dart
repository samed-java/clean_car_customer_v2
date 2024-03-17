import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:clean_car_customer_v2/features/profile_section/reservations/data/model/reservations_model.dart';
import 'package:clean_car_customer_v2/features/profile_section/reservations/data/repo/reservations_repository.dart';
import 'package:clean_car_customer_v2/locator.dart';
import 'package:clean_car_customer_v2/utils/errors/base_error_handler.dart';

part 'reservations_state.dart';

class ReservationsCubit extends Cubit<ReservationsState> with BaseErrorHandler {
  ReservationsCubit() : super(ReservationsInitial());

  ReservationsResModel? result;

  @override
  Future<void> onProgress() async {
    if(result==null) emit(ReservationsLoading());
    result = await locator.get<ReservationsRepository>().fetch();
    print("------------");
    print(result);
    if (result != null) {
      emit(ReservationsSuccess(result!));
    } else {
      emit(ReservationsErrorState("No data"));
    }
  }

  @override
  void onSocketException(SocketException e) {
    emit(ReservationsErrorState("Network error"));
    super.onSocketException(e);
  }

  @override
  void onOtherError(Object e, StackTrace s) {
    emit(ReservationsErrorState("Unhandled exception"));
    super.onOtherError(e, s);
  }
}
