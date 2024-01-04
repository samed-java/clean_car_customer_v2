import 'dart:io';
import 'package:clean_car_customer_v2/data/services/local/storage_service.dart';
import 'package:clean_car_customer_v2/features/home/data/model/req/filter_req_model.dart';
import 'package:clean_car_customer_v2/features/home/data/model/res/branchs_res_model.dart';
import 'package:clean_car_customer_v2/features/home/data/model/res/regions_res_model.dart';
import 'package:clean_car_customer_v2/features/home/data/repo/filial_repo.dart';
import 'package:clean_car_customer_v2/features/home/data/repo/regions_repo.dart';
import 'package:clean_car_customer_v2/utils/extensions/model_extensions/obj_list_to_map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clean_car_customer_v2/locator.dart';
import 'package:clean_car_customer_v2/utils/errors/base_error_handler.dart';

import '../../../utils/errors/errors.dart';
// import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> with BaseErrorHandler {
  HomeCubit() : super(HomeInitial()) {
    activeStatus =
        ValueNotifier<FilterFieldActiveStatus>(const FilterFieldActiveStatus(
      city: true,
      region: false,
      village: false,
    ));
    _getFilterParams();
  }
  final StorageService _storageService = locator.get<StorageService>();
  late final RegionResModel _regionResModel;
  Map<int, Region> cities = {};
  Map<int, Region> regions = {};
  Map<int, Region> villages = {};

  int? selectedCity;
  int? selectedRegion;
  int? selectedVillage;

  late ValueNotifier<FilterFieldActiveStatus> activeStatus;

  @override
  Future<void> onProgress() async {
    emit(HomeLoading());
    //try{
    var result = await locator.get<BranchsRepository>().fetch(
        queryParameters: FilterReqModel(
            villageId: selectedVillage,
            cityId: selectedCity,
            regionId: selectedRegion));
    print(result);
    emit(HomeSuccess(data: result));
    // }catch(e,s){
    //   print(e);
    //   print(s);
    // }
  }

  @override
  void onSocketException(SocketException e) {
    print(e);
    emit(HomeFail(message: "Check connection"));
  }

  @override
  void onOtherError(Object e, StackTrace s) {
    print(e);
    print(s);
    emit(HomeFail(message: "Unknown Error"));
  }

  @override
  void onDataIsNullError(DataIsNullError e) {
    print(e);
    emit(HomeFail(message: "$e"));
  }

  void _getFilterParams() {
    ErrorHandler(progressAction: () async {
      var result = await locator.get<RegionsRepository>().fetch();
      _storageService.setRegions(result.toJson());
      _regionResModel = result;
      getCities();
    }).execute();
  }

  Map<int, Region> getCities() {
    cities = _regionResModel.regions
        .objToMap<int, Region>(key: (e) => e.id, value: (e) => e);
    activeStatus.value = FilterFieldActiveStatus(
      city: cities.isNotEmpty,
      region: regions.isNotEmpty,
      village: villages.isNotEmpty,
    );
    return cities;
  }

  Map<int, Region> getRegions(int id) {
    regions = cities[id]
        ?.regions
        ?.objToMap<int, Region>(key: (e) => e.parentId!, value: (e) => e);

    activeStatus.value = FilterFieldActiveStatus(
      city: cities.isNotEmpty,
      region: regions.isNotEmpty,
      village: villages.isNotEmpty,
    );
    return regions;
  }

  Map<int, Region> getVillages(int id) {
    villages = regions[id]
        ?.villages
        ?.objToMap<int, Region>(key: (e) => e.parentId!, value: (e) => e);

    activeStatus.value = FilterFieldActiveStatus(
      city: cities.isNotEmpty,
      region: regions.isNotEmpty,
      village: villages.isNotEmpty,
    );

    return villages;
  }
}

class FilterFieldActiveStatus {
  final bool city;
  final bool region;
  final bool village;

  const FilterFieldActiveStatus(
      {required this.city, required this.region, required this.village});
}
