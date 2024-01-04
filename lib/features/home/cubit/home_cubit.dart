import 'dart:io';
import 'package:clean_car_customer_v2/data/services/local/storage_service.dart';
import 'package:clean_car_customer_v2/features/home/data/model/req/filter_req_model.dart';
import 'package:clean_car_customer_v2/features/home/data/model/res/branchs_res_model.dart';
import 'package:clean_car_customer_v2/features/home/data/model/res/regions_res_model.dart';
import 'package:clean_car_customer_v2/features/home/data/repo/filial_repo.dart';
import 'package:clean_car_customer_v2/features/home/data/repo/regions_repo.dart';
import 'package:clean_car_customer_v2/utils/extensions/model_extensions/obj_list_to_map.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clean_car_customer_v2/locator.dart';
import 'package:clean_car_customer_v2/utils/errors/base_error_handler.dart';
import 'package:rxdart/rxdart.dart';
import '../../../utils/errors/errors.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> with BaseErrorHandler {
  HomeCubit() : super(HomeInitial()) {
    _getFilterParams();

    selectedCity.stream.listen((event) {
      print(event);
      getRegions(event);
      selectedRegion.sink.add(0);
      print(regions);
    });

    selectedRegion.stream.listen((event) {
      print(event);
      getVillages(event);
      selectedVillage.sink.add(0);
      print(villages);
    });
  }
  final StorageService _storageService = locator.get<StorageService>();
  late final RegionResModel _regionResModel;
  Map<int, Region?> cities = <int, Region?>{};
  Map<int, Region?> regions = <int, Region?>{};
  Map<int, Region?> villages = <int, Region?>{};
  BehaviorSubject<int?> selectedCity = BehaviorSubject<int?>();
  BehaviorSubject<int?> selectedRegion = BehaviorSubject<int?>();
  BehaviorSubject<int?> selectedVillage = BehaviorSubject<int?>();

  //late ValueNotifier<FilterFieldActiveStatus> activeStatus;

  @override
  Future<void> onProgress() async {
    emit(HomeLoading());
    //try{
    var result = await locator.get<BranchsRepository>().fetch(
        queryParameters: FilterReqModel(
            villageId: selectedVillage.stream.valueOrNull,
            cityId: selectedCity.stream.valueOrNull,
            regionId: selectedRegion.stream.valueOrNull));
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
      var result = await locator.get<RegionsRepository>().fetch();
      _storageService.setRegions(result.toJson());
      _regionResModel = result;
      getCities();
    }).execute();
  }

  getCities() {
    Map<int, Region?> regionList = _regionResModel.regions
        .objToMap<int, Region>(key: (e) => e.id, value: (e) => e);
    print(cities);
    Map<int, Region?> regionInit = {0: null};
    regionInit.addAll(regionList);
    cities = regionInit;
  }

  getRegions(int? id) {
    Map<int, Region?> regionList = id != null
        ? (cities[id]?.regions?.objToMap<int, Region>(
                key: (e) => e.parentId!, value: (e) => e) ??
            {})
        : {};
    Map<int, Region?> regionInit = {0: null};
    regionInit.addAll(regionList);
    regions = regionInit;
    print(regions);
    // villages = {};
  }

  getVillages(int? id) {
    Map<int, Region?> regionList = id != null
        ? (regions[id]?.villages?.objToMap<int, Region>(
                key: (e) => e.parentId!, value: (e) => e) ??
            {})
        : {};

    Map<int, Region?> regionInit = {0: null};
    regionInit.addAll(regionList);
    villages = regionInit;
    print(villages);
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
