import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:clean_car_customer_v2/features/branches_and_reservation/reservation/data/model/res/reservation_parameters_res_model.dart';
import 'package:clean_car_customer_v2/features/branches_and_reservation/reservation/data/repo/reservation_parameters_repo.dart';
import 'package:clean_car_customer_v2/features/branches_and_reservation/reservation/data/repo/reservation_submit_repo.dart';
import 'package:clean_car_customer_v2/locator.dart';
import 'package:clean_car_customer_v2/utils/errors/base_error_handler.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import '../../../profile_section/my_cars/data/model/res/my_cars_res_model.dart';
import '../data/model/req/reservation_parameters_req_model.dart';
import '../data/model/req/reservation_submit_req_model.dart';

part 'reservation_state.dart';

class ReservationCubit extends Cubit<ReservationState> with BaseErrorHandler {
  ReservationCubit({Branch? branch}) : super(ReservationInitial()) {
    selectedBranch = ValueNotifier<Branch?>(branch);
    selectedCar.addListener(() {
      if (selectedBranch.value != null) {
        execute();
      }
    });
    selectedDate.addListener(() {
      if (selectedService.value != null) {
        execute();
      }
    });
    selectedBranch.addListener(() {
      if (selectedCar.value != null) {
        execute();
      }
    });
    selectedService.addListener(() {
      if (selectedDate.value != null) {
        execute();
      }
    });
  }

  late ValueNotifier<Branch?> selectedBranch;
  ValueNotifier<Car?> selectedCar = ValueNotifier<Car?>(null);
  ValueNotifier<Time?> selectedTime = ValueNotifier<Time?>(null);
  ValueNotifier<Service?> selectedService = ValueNotifier<Service?>(null);
  ValueNotifier<DateTime?> selectedDate = ValueNotifier<DateTime?>(null);

  void selectBranch(Branch branch) => selectedBranch.value = branch;
  void selectCar(Car car) => selectedCar.value = car;
  void selectTime(Time time) => selectedTime.value = time;
  void selectService(Service service) => selectedService.value = service;
  void selectDate(DateTime date) => selectedDate.value = date;

  //late ValueNotifier<int> washingId;
  BehaviorSubject<ReservationParametersResModel> params =
      BehaviorSubject<ReservationParametersResModel>();

  //Map<String,int> get branchs

  @override
  Future<void> onProgress() async {
    var result = await locator.get<ReservationParametersRepository>().fetch(
        queryParameters: ReservationParametersReqModel(
            washingId: selectedBranch.value?.id,
            banId: selectedCar.value?.banType.id,
            date: selectedDate.value != null
                ? DateFormat('dd.MM.yyyy').format(selectedDate.value!)
                : null));
    if (result != null) {
      params.value = result;
    }
  }

  @override
  void onSocketException(SocketException e) {
    print(e);
    super.onSocketException(e);
  }

  @override
  void onOtherError(Object e, StackTrace s) {
    print(e);
    print(s);
    super.onOtherError(e, s);
  }


  void reserve(){
    ErrorHandler(
      progressAction: () async {
        emit(ReservationLoading());
        var result = locator.get<ReservationSubmitRepo>().send(ReservationSubmitReqModel(
            washingId: selectedBranch.value!.id.toString(),
            serviceId: selectedService.value!.serviceId.toString(),
            carId: selectedCar.value!.id.toString(),
            day: DateFormat('dd.MM.yyyy').format(selectedDate.value!),
            time: selectedTime.value!.time,
            price: selectedService.value!.price

        ));
        emit(ReservationSuccess());
      },
      socketExceptionAction: (e){
        emit(ReservationError());
    },
      otherErrorAction: (e,s){
        print(e);
        print(s);
        emit(ReservationError());
      }
    ).execute();
  }
}
