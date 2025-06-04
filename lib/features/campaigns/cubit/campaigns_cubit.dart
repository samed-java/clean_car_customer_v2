import 'dart:io';

import 'package:clean_car_customer_v2/features/campaigns/data/model/res/campaigns_res_model.dart';
import 'package:clean_car_customer_v2/features/campaigns/data/repo/campaigns_repo.dart';
import 'package:clean_car_customer_v2/locator.dart';
import 'package:clean_car_customer_v2/utils/errors/base_error_handler.dart';
import 'package:clean_car_customer_v2/utils/extensions/locale_extension/locale_extension.dart';
import 'package:clean_car_customer_v2/utils/services/navigation_service/navigation_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

part 'campaigns_state.dart';

class CampaignsCubit extends Cubit<CampaignsState> with BaseErrorHandler {
  CampaignsCubit() : super(CampaignsInitial());

  BehaviorSubject<CampaignResModel> result = BehaviorSubject();

  @override
  void execute() {
    // TODO: implement execute
    super.execute();
  }

  @override
  Future<void> onProgress() async {
    if (result.valueOrNull == null) emit(CampaignsLoading());
    result.value = await locator.get<CampaignsRepository>().fetch();
    emit(CampaignsSuccess(data: result.valueOrNull!));
  }

  @override
  void onSocketException(SocketException e) {
    emit(CampaignsFail(message: "Check connection"));
  }

  @override
  void onOtherError(e, s) {
    print(e);
    print(s);
    emit(CampaignsFail(
        message: NavigationService.instance.context.locale.unknownError));
  }

  int calculateNew() {
    var value = result.valueOrNull;
    int count = value?.campaigns != null
        ? value?.campaigns!
                .where((e) => e.endDate!.isAfter(DateTime.now()))
                .length ??
            0
        : 0;

    return count;
  }
}
