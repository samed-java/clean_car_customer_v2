import 'dart:io';

import 'package:clean_car_customer_v2/features/offers/data/repo/offers_repo.dart';
import 'package:clean_car_customer_v2/locator.dart';
import 'package:clean_car_customer_v2/utils/errors/base_error_handler.dart';
import 'package:clean_car_customer_v2/utils/extensions/locale_extension/locale_extension.dart';
import 'package:clean_car_customer_v2/utils/services/navigation_service/navigation_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/model/res/offers_res_model.dart';

part 'offers_state.dart';

class OffersCubit extends Cubit<OffersState> with BaseErrorHandler {
  OffersCubit() : super(OffersInitial());

  OfferResModel? result;

  @override
  void execute() {
    // TODO: implement execute
    super.execute();
  }

  @override
  Future<void> onProgress() async {
    if(result==null) emit(OffersLoading());
    result = await locator.get<OffersRepository>().fetch();
    emit(OffersSuccess(data: result!));
  }

  @override
  void onSocketException(SocketException e) {
    emit(OffersFail(message: "Check connection"));
  }

  @override
  void onOtherError(e, s) {
    print(e);
    print(s);
    emit(OffersFail(
        message: NavigationService.instance.context.locale.unknownError));
  }
}
