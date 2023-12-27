import 'dart:io';

import 'package:clean_car_customer_v2/data/services/local/storage_service.dart';
import 'package:clean_car_customer_v2/features/profile_section/my_cars/data/model/res/ban_types_res_model.dart';
import 'package:clean_car_customer_v2/features/profile_section/my_cars/data/repo/ban_types_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clean_car_customer_v2/features/profile_section/my_cars/data/model/req/add_cars_req_model.dart';
import 'package:clean_car_customer_v2/features/profile_section/my_cars/data/model/res/my_cars_res_model.dart';
import 'package:clean_car_customer_v2/features/profile_section/my_cars/data/repo/my_cars_repo.dart';
import 'package:clean_car_customer_v2/locator.dart';
import 'package:clean_car_customer_v2/utils/errors/base_error_handler.dart';

import '../../../../utils/errors/errors.dart';
import '../../../../utils/pager/go.dart';

part 'my_cars_state.dart';

class MyCarsCubit extends Cubit<MyCarsState> with BaseErrorHandler {
  MyCarsCubit() : super(MyCarsInitial());
  final StorageService _storage = locator.get<StorageService>();

  int? selectedBanType;
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  @override
  Future<void> onProgress() async {
    emit(MyCarsLoading());
    var result = await locator<MyCarsRepository>().fetch();
    emit(MyCarsSuccess(data: result));
  }

  @override
  void onDataIsNullError(DataIsNullError e) {
    emit(MyCarsError(message: "Data not found"));
    super.onDataIsNullError(e);
  }

  @override
  void onSocketException(SocketException e) {
    emit(MyCarsError(message: "No connection"));
    super.onSocketException(e);
  }

  @override
  void onOtherError(Object e, StackTrace s) {
    emit(MyCarsError(message: "Unhandled exception"));
    super.onOtherError(e, s);
  }

  void addCar() {
    ErrorHandler(progressAction: () async {
      await locator<MyCarsRepository>().addCar(
          data: AddCarsReqModel(
              carModel: nameController.text,
              carNumber: numberController.text,
              banId: selectedBanType!.toString()));
      Go.back();
      nameController.clear();
      numberController.clear();
      selectedBanType = null;
      execute();
    }).execute();
  }

  void updateCar({required int id}) {
    ErrorHandler(progressAction: () async {
      await locator<MyCarsRepository>().updateCar(
          data: AddCarsReqModel(
              carModel: nameController.text,
              carNumber: numberController.text,
              banId: selectedBanType!.toString()),
          id: id);
      Go.back();
      nameController.clear();
      numberController.clear();
      selectedBanType = null;
      execute();
    }).execute();
  }

  void deleteCar({
    required int id,
  }) {
    var progress = ErrorHandler(progressAction: () async {
      //try{
      await locator<MyCarsRepository>().deleteCar(id: id);
      // }catch(e,s){
      //   print("lazimli eroorrrrrr");
      //   print(e.runtimeType);
      //   if(e is DataIsNullError){
      //     Go.back();
      //     nameController.clear();
      //     numberController.clear();
      //     selectedBanType = null;
      //     execute();
      //   }
      // }
    }, dataIsNullErrorAction: (e) {
      print("lazimli eroorrrrrr");
      Go.back();
      nameController.clear();
      numberController.clear();
      selectedBanType = null;
      execute();
    },
        otherErrorAction: (e, s) {
      // if (e is DataIsNullError) {
      //   print("lazimli eroorrrrrr");
      //   Go.back();
      //   nameController.clear();
      //   numberController.clear();
      //   selectedBanType = null;
      //   execute();
      // }
    })..execute();
  }

  void getBanTypes() {
    ErrorHandler(progressAction: () async {
      var result = await locator<BanTypesRepository>().fetch();
      _storage.setBanTypes(result.toJson());
    }, otherErrorAction: (e, s) {
      if (kDebugMode) {
        print(e);
        print(s);
      }
    }).execute();
  }

  Map<String, int> get banTypesNameToId {
    List<Ban> bans = _storage.getBanTypes() != null
        ? BanTypesResModel.fromJson(_storage.getBanTypes()!).bans
        : [];
    var map = Map<String, int>.fromEntries(
        bans.map<MapEntry<String, int>>((e) => MapEntry(e.title, e.id)));
    return map;
  }

  Map<int, String> get banTypesIdToName {
    List<Ban> bans = _storage.getBanTypes() != null
        ? BanTypesResModel.fromJson(_storage.getBanTypes()!).bans
        : [];
    var map = Map<int, String>.fromEntries(
        bans.map<MapEntry<int, String>>((e) => MapEntry(e.id, e.title)));
    return map;
  }
}
