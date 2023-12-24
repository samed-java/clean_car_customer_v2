import 'dart:io';

import 'package:clean_car_customer_v2/features/offers/data/repo/offers_repo.dart';
import 'package:clean_car_customer_v2/locator.dart';
import 'package:clean_car_customer_v2/utils/errors/base_error_handler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/model/res/offers_res_model.dart';

part 'offers_state.dart';

class OffersCubit extends Cubit<OffersState> with BaseErrorHandler {
  OffersCubit() : super(OffersInitial());

  @override
  void execute() {
    // TODO: implement execute
    super.execute();
  }

  @override
  void onProgress() async {
    emit(OffersLoading());
    var result = await locator.get<OffersRepository>().fetch();
    emit(OffersSuccess(data: result));
  }

  @override
  void onSocketException(SocketException e) {
    emit(OffersFail(message: "Check connection"));
  }

  @override
  void onOtherError(e, s) {
    print(e);
    print(s);
    emit(OffersFail(message: "Unknown error"));
  }
}
