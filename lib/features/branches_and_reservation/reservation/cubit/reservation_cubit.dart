import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:clean_car_customer_v2/constants/res/values_manager.dart';
import 'package:clean_car_customer_v2/features/branches_and_reservation/reservation/data/model/res/reservation_parameters_res_model.dart';
import 'package:clean_car_customer_v2/features/branches_and_reservation/reservation/data/repo/reservation_parameters_repo.dart';
import 'package:clean_car_customer_v2/features/branches_and_reservation/reservation/data/repo/reservation_submit_repo.dart';
import 'package:clean_car_customer_v2/locator.dart';
import 'package:clean_car_customer_v2/utils/errors/base_error_handler.dart';
import 'package:clean_car_customer_v2/utils/services/firebase/analytics/analytic_logger.dart';
import 'package:clean_car_customer_v2/utils/services/firebase/analytics/event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../utils/snacks/snacks.dart';
import '../../../profile_section/my_cars/data/model/res/my_cars_res_model.dart';
import '../data/model/req/reservation_parameters_req_model.dart';
import '../data/model/req/reservation_submit_req_model.dart';
import '../data/repo/reservation_update_repo.dart';

part 'reservation_state.dart';

class ReservationCubit extends Cubit<ReservationState> with BaseErrorHandler {
  ReservationCubit(
      {required this.isNew,
      required this.isRenew,
      this.reservationId,
      Branch? branch,
      Car? car,
      Time? time,
      Service? service,
      DateTime? dateTime})
      : super(ReservationInitial()) {
    selectedBranch = ValueNotifier<Branch?>(branch);
    selectedCar = ValueNotifier<Car?>(car);
    selectedTime = ValueNotifier<Time?>(time);
    selectedService = ValueNotifier<Service?>(service);
    selectedDate = ValueNotifier<DateTime?>(dateTime);
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
  bool inProgress = false;
  late ValueNotifier<Car?> selectedCar;
  late ValueNotifier<Time?> selectedTime;
  late ValueNotifier<Service?> selectedService;
  late ValueNotifier<DateTime?> selectedDate;
  final bool isNew;
  final bool isRenew;
  final String? reservationId;
  final ScrollController scrollController = ScrollController();
  void selectBranch(Branch? branch) => selectedBranch.value = branch;
  void selectCar(Car car) => selectedCar.value = car;
  void selectTime(Time time) {
    selectedTime.value = time;
    _scrollDown();
  }

  void selectService(Service service) => selectedService.value = service;
  void selectDate(DateTime date) {
    selectedDate.value = date;
  }

  void _scrollDown() async {
    await Future.delayed(DurationConstant.ms300);
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: DurationConstant.ms100,
      curve: Curves.fastOutSlowIn,
    );
  }

  //late ValueNotifier<int> washingId;
  BehaviorSubject<ReservationParametersResModel> params =
      BehaviorSubject<ReservationParametersResModel>();

  //Map<String,int> get branchs

  @override
  Future<void> onProgress() async {
    var result = await locator.get<ReservationParametersRepository>().fetch(
        queryParameters: ReservationParametersReqModel(
            washingId: selectedBranch.value?.id,
            banId: selectedCar.value?.banType?.id,
            date: selectedDate.value != null
                ? DateFormat('dd.MM.yyyy').format(selectedDate.value!)
                : null));
    if (result != null) {
      print("==============");
      print(result.services);
      print("==============");

      params.value = result;
      if (selectedDate.value != null) {
        _scrollDown();
      }
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

  void reserve() {
    ErrorHandler(progressAction: () async {
      if(inProgress) return;
      inProgress = true;
      emit(ReservationLoading());
      var model = ReservationSubmitReqModel(
          washingId: selectedBranch.value!.id.toString(),
          serviceId: selectedService.value!.serviceId.toString(),
          carId: selectedCar.value!.id.toString(),
          day: DateFormat('dd.MM.yyyy').format(selectedDate.value!),
          time: selectedTime.value!.time,
          price: selectedService.value!.price,
          status: (!isNew && !isRenew) ? 1 : null);
      var result;
      print(model.toJson());

      if (!isNew && reservationId != null && !isRenew) {
        result = await locator
            .get<ReservationUpdateRepo>()
            .send(model, path: {"id": reservationId});
      } else {
        result = await locator.get<ReservationSubmitRepo>().send(model);
      }
      locator.get<EventLogger>().logEvent(event: Event.confirm_reservation,data: model.toJson());
      emit(ReservationSuccess());
      inProgress = false;
    }, socketExceptionAction: (e) {
      emit(ReservationError());
      inProgress = false;
      Snacks.showCustomSnack(message: "Connection error", isSucces: false);
    }, otherErrorAction: (e, s) {
      print(e);
      print(s);
      emit(ReservationError());
      inProgress = false;
      Snacks.showCustomSnack(message: "Unknown error occured", isSucces: false);
    }).execute();
  }
}
