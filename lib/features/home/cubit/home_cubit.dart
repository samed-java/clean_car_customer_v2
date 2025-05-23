import 'dart:io';
import 'package:clean_car_customer_v2/data/services/local/storage_service.dart';
import 'package:clean_car_customer_v2/features/home/data/model/req/filter_req_model.dart';
import 'package:clean_car_customer_v2/features/home/data/model/res/branchs_res_model.dart';
import 'package:clean_car_customer_v2/features/home/data/model/res/regions_res_model.dart';
import 'package:clean_car_customer_v2/features/home/data/repo/filial_repo.dart';
import 'package:clean_car_customer_v2/features/home/data/repo/regions_repo.dart';
import 'package:clean_car_customer_v2/features/home/data/repo/services_repo.dart';
import 'package:clean_car_customer_v2/utils/extensions/locale_extension/locale_extension.dart';
import 'package:clean_car_customer_v2/utils/extensions/model_extensions/obj_list_to_map.dart';
import 'package:clean_car_customer_v2/utils/services/navigation_service/navigation_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clean_car_customer_v2/locator.dart';
import 'package:clean_car_customer_v2/utils/errors/base_error_handler.dart';
import 'package:location/location.dart';
import '../../../utils/errors/errors.dart';
import '../data/model/res/services_res_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> with BaseErrorHandler {
  HomeCubit() : super(HomeInitial()) {
    _getFilterParams();

    selectedCity.addListener(() {
      print("city id:  ${selectedCity.value}");
      selectedRegion.value = 0;
      _filteredParameters[0] = selectedCity.value == 0 ? 0 : 1;
      print(_filteredParameters);
      selectedRegion.notifyListeners();
      getRegions(selectedCity.value);
    });

    selectedRegion.addListener(() {
      print("region id:  ${selectedRegion.value}");
      selectedVillage.value = 0;
      _filteredParameters[1] = selectedRegion.value == 0 ? 0 : 1;
      print(_filteredParameters);
      selectedVillage.notifyListeners();
      getVillages(selectedRegion.value);
    });

    selectedVillage.addListener(() {
      _filteredParameters[2] = selectedVillage.value == 0 ? 0 : 1;
      print(_filteredParameters);
    });

    selectedService.addListener(() {
      _filteredParameters[3] = selectedService.value == 0 ? 0 : 1;
      print(_filteredParameters);
    });
  }
  final StorageService _storageService = locator.get<StorageService>();
  late final RegionResModel _regionResModel;
  late final ServicesResModel _servicesResModel;
  final FocusNode focusNode = FocusNode();
  Map<int, Region?> cities = <int, Region?>{};
  Map<int, Region?> regions = <int, Region?>{};
  Map<int, Region?> villages = <int, Region?>{};
  Map<int, ServiceItem?> services = <int, ServiceItem?>{};
  ValueNotifier<int?> selectedCity = ValueNotifier<int?>(0);
  ValueNotifier<int?> selectedRegion = ValueNotifier<int?>(0);
  ValueNotifier<int?> selectedVillage = ValueNotifier<int?>(0);
  ValueNotifier<int?> selectedService = ValueNotifier<int?>(0);
  TextEditingController searchController = TextEditingController();
  BranchsResModel? mainResult;
  BranchsResModel? filteredResult;
  LocationData? position;
  bool isFullTime = false;

  void setFullTime(bool value) => isFullTime = value;


  final List<int> _filteredParameters = [0, 0, 0, 0];

  bool get isFilterNotEmpty =>
      (_filteredParameters.fold<int>(
          0, (previousValue, e) => previousValue + e) >
      0) || isFullTime;

  //late ValueNotifier<FilterFieldActiveStatus> activeStatus;

  @override
  Future<void> onProgress() async {
    filteredResult = null;
    if(mainResult==null || filteredResult == null) emit(HomeLoading());
    //try{
      PermissionStatus status =  await Location.instance.hasPermission();
      print(status);
      if (position==null && (status == PermissionStatus.granted || status == PermissionStatus.grantedLimited)) {
      position = await Location.instance.getLocation();
      print(position?.latitude);
      print(position?.longitude);
      }
    mainResult = await locator.get<BranchsRepository>().fetch(
      queryParameters: FilterReqModel(
        lat: position?.latitude?.toString(),
        lon: position?.longitude?.toString(),
      )
    );

    filteredResult = await locator.get<BranchsRepository>().fetch(
        queryParameters: FilterReqModel(
            lat: position?.latitude?.toString(),
            lon: position?.longitude?.toString(),
            villageId:
            selectedVillage.value == 0 ? null : selectedVillage.value,
            isFullTime: isFullTime,
            cityId: selectedCity.value == 0 ? null : selectedCity.value,
            serviceId:
            selectedService.value == 0 ? null : selectedService.value,
            regionId: selectedRegion.value == 0 ? null : selectedRegion.value,
            text: searchController.text.isNotEmpty
                ? searchController.text
                : null));

    //print(result);
    emit(HomeSuccess(
        //data: result
        ));
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
    emit(HomeFail(
        message: NavigationService.instance.context.locale.unknownError));
  }

  @override
  void onDataIsNullError(DataIsNullError e) {
    print(e);
    emit(HomeFail(message: "$e"));
  }

  @override
  void onNotSuccessError(NotSuccessError e) {
    print(e);
    super.onNotSuccessError(e);
  }

  @override
  void onResponseBodyIsNullError(ResponseBodyIsNullError e) {
    print(e);
    super.onResponseBodyIsNullError(e);
  }

  void _getFilterParams() {
    ErrorHandler(progressAction: () async {
      var regions = await locator.get<RegionsRepository>().fetch();
      _storageService.setRegions(regions.toJson());
      _regionResModel = regions;
      var services = await locator.get<ServicesRepository>().fetch();
      _storageService.setServices(services.toJson());
      _servicesResModel = services;
      getCities();
      getServices();
    }).execute();
  }

  getCities() {
    Map<int, Region?> regionList = _regionResModel.regions
        .objToMap<int, Region>(key: (e) => e.id, value: (e) => e);
    //print(cities);
    Map<int, Region?> regionInit = {0: null};
    regionInit.addAll(regionList);
    cities = regionInit;
    // print(
    //     "cities ${cities.map<int, dynamic>((key, value) => MapEntry<int, dynamic>(key, value?.id))}");
  }

  getServices() {
    Map<int, ServiceItem?> serviceList = _servicesResModel.services
        .objToMap<int, ServiceItem>(key: (e) => e.id, value: (e) => e);
    print(cities);
    Map<int, ServiceItem?> serviceInit = {0: null};
    serviceInit.addAll(serviceList);
    services = serviceInit;
    // print(
    //     "services ${services.map<int, dynamic>((key, value) => MapEntry<int, dynamic>(key, value?.id))}");
  }

  getRegions(int? id) {
    Map<int, Region?> regionList = id != null
        ? (cities[id]
                ?.regions
                ?.objToMap<int, Region>(key: (e) => e.id, value: (e) => e) ??
            {})
        : {};
    Map<int, Region?> regionInit = {0: null};
    regionInit.addAll(regionList);
    regions = regionInit;
    // print(
    //     "regions ${regions.map<int, dynamic>((key, value) => MapEntry<int, dynamic>(key, value?.id))}");
    // villages = {};
  }

  getVillages(int? id) {
    Map<int, Region?> regionList = id != null
        ? (regions[id]
                ?.villages
                ?.objToMap<int, Region>(key: (e) => e.id!, value: (e) => e) ??
            {})
        : {};

    Map<int, Region?> regionInit = {0: null};
    regionInit.addAll(regionList);
    villages = regionInit;

    // print(
    //     "villages ${villages.map<int, dynamic>((key, value) => MapEntry<int, dynamic>(key, value?.id))}");
  }

  void clearFilter() {
    isFullTime = false;
    selectedCity.value = 0;
    selectedRegion.value = 0;
    selectedVillage.value = 0;
    selectedService.value = 0;
    execute();
  }
}

// class FilterFieldActiveStatus {
//   final bool city;
//   final bool region;
//   final bool village;
//
//   const FilterFieldActiveStatus(
//       {required this.city, required this.region, required this.village});
// }
