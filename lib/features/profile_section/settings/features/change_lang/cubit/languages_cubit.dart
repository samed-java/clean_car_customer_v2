import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:clean_car_customer_v2/data/services/local/storage_service.dart';
import 'package:clean_car_customer_v2/features/profile_section/settings/features/change_lang/data/model/res/languages_res_model.dart';
import 'package:clean_car_customer_v2/features/profile_section/settings/features/change_lang/data/repo/languages_repo.dart';
import 'package:clean_car_customer_v2/locator.dart';
import 'package:clean_car_customer_v2/utils/errors/base_error_handler.dart';
import 'package:clean_car_customer_v2/utils/extensions/locale_extension/locale_extension.dart';
import 'package:clean_car_customer_v2/utils/services/navigation_service/navigation_service.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../../../utils/errors/errors.dart';

part 'languages_state.dart';

class LanguagesCubit extends Cubit<LanguagesState> with BaseErrorHandler {
  LanguagesCubit() : super(LanguagesInitial()) {
    _checkAndSetCode();

    // selectedLanguage.stream.listen((event) async {
    //   await _service.setLangCode(event!);
    // });
  }

  final StorageService _service = locator.get<StorageService>();
  BehaviorSubject<String?> selectedLanguage = BehaviorSubject<String?>();

  void _checkAndSetCode() async {
    //bool isAnySelected = await _service.hasLangCode;
    //if(isAnySelected){
    selectedLanguage.sink.add(_service.getLangCode());
    //}
  }

  void changeLanguage(String lang) async {
    selectedLanguage.sink.add(lang);
    await _service.setLangCode(lang);
  }

  @override
  Future<void> close() {
    NavigationService.instance.context.changeOrRefreshLang();
    return super.close();
  }

  @override
  Future<void> onProgress() async {
    emit(LanguagesLoading());
    var result = await locator.get<LanguagesRepository>().fetch();
    emit(LanguagesSuccess(result));
  }

  @override
  void onSocketException(SocketException e) {
    emit(LanguagesFail());
    super.onSocketException(e);
  }

  @override
  void onOtherError(Object e, StackTrace s) {
    emit(LanguagesFail());
    super.onOtherError(e, s);
  }

  @override
  void onDataIsNullError(DataIsNullError e) {
    emit(LanguagesFail());
    super.onDataIsNullError(e);
  }

  @override
  void onNotSuccessError(NotSuccessError e) {
    emit(LanguagesFail());
    super.onNotSuccessError(e);
  }

  @override
  void onResponseBodyIsNullError(ResponseBodyIsNullError e) {
    emit(LanguagesFail());
    super.onResponseBodyIsNullError(e);
  }
}
