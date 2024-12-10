import 'dart:io';

import 'package:clean_car_customer_v2/features/notification/data/model/req/change_notification_read_req_model.dart';
import 'package:clean_car_customer_v2/features/notification/data/model/res/notifications_res_model.dart';
import 'package:clean_car_customer_v2/features/notification/data/repo/read_notifications_repo.dart';
import 'package:clean_car_customer_v2/locator.dart';
import 'package:clean_car_customer_v2/utils/errors/base_error_handler.dart';
import 'package:clean_car_customer_v2/utils/extensions/locale_extension/locale_extension.dart';
import 'package:clean_car_customer_v2/utils/services/navigation_service/navigation_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

import '../data/repo/notifications_repo.dart';

part 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState>
    with BaseErrorHandler {
  NotificationsCubit() : super(NotificationsInitial());

  BehaviorSubject<NotificationsResModel> result = BehaviorSubject();

  @override
  void execute() {
    // TODO: implement execute
    super.execute();
  }

  @override
  Future<void> onProgress() async {
    if (result.valueOrNull?.notifications?.isEmpty ?? true)
      emit(NotificationsLoading());
    result.value = await locator.get<NotificationsRepository>().fetch();
    emit(NotificationsSuccess(data: result.valueOrNull!));
  }

  @override
  void onSocketException(SocketException e) {
    emit(NotificationsFail(message: "Check connection"));
  }

  @override
  void onOtherError(e, s) {
    print(e);
    print(s);
    emit(NotificationsFail(
        message: NavigationService.instance.context.locale.unknownError));
  }

  void readNotification(String id) async {
    ErrorHandler(progressAction: () async {
      await locator.get<ReadNotificationsRepository>().send(
          ChangeNotificationReadReqModel(isRead: true),
          path: {"id": id});
    },
      dataIsNullErrorAction: (e){
        execute();
      }

    ).execute();
  }
}
