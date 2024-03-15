import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:clean_car_customer_v2/features/profile_section/settings/features/faq/data/model/faq_res_model.dart';
import 'package:clean_car_customer_v2/features/profile_section/settings/features/faq/data/repository/faq_repository.dart';
import 'package:clean_car_customer_v2/locator.dart';
import 'package:clean_car_customer_v2/utils/errors/base_error_handler.dart';
import 'package:clean_car_customer_v2/utils/extensions/locale_extension/locale_extension.dart';

import '../../../../../../utils/services/navigation_service/navigation_service.dart';

part 'faq_state.dart';

class FaqCubit extends Cubit<FaqState> with BaseErrorHandler {
  FaqCubit() : super(FaqInitial());

  @override
  void execute() {
    super.execute();
  }

  @override
  Future<void> onProgress() async {
    emit(FaqLoading());
    var result = await locator.get<FaqRepository>().fetch();

    emit(FaqSuccess(data: result));
  }

  @override
  void onSocketException(SocketException e) {
    emit(FaqFail(message: "Check connection"));
  }

  @override
  void onOtherError(e, s) {
    print(e);
    print(s);
    emit(FaqFail(message: "NavigationService.instance.context.locale.unknown"));
  }
}
