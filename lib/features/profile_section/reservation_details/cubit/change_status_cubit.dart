import 'package:clean_car_customer_v2/features/profile_section/reservation_details/data/model/change_status_req_model.dart';
import 'package:clean_car_customer_v2/features/profile_section/reservation_details/data/repo/change_status_repository.dart';
import 'package:clean_car_customer_v2/features/profile_section/reservations/data/model/reservations_model.dart';
import 'package:clean_car_customer_v2/locator.dart';
import 'package:clean_car_customer_v2/utils/errors/base_error_handler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'change_status_state.dart';

class ChangeStatusCubit extends Cubit<ChangeStatusState> with BaseErrorHandler {
  ChangeStatusCubit() : super(ChangeStatusInitial());

  int? currentStatus;

  @override
  Future<void> onProgress() async {
    // TODO: implement onProgress
    super.execute();
  }

  void changeStatus(Active model, int status) {
    ErrorHandler(
      progressAction: () async {
        await locator
            .get<ChangeStatusEnableDisableRepository>()
            .send(ChangeStatusReqModel(reservationId: model.id, status: status));
      },
      notSuccessErrorAction: (e) {},
      responseBodyIsNullErrorAction: (e) {},
      dataIsNullErrorAction: (e){
        currentStatus = status;
        emit(ChangeStatusSuccess());
      },
      otherErrorAction: (e, s) {},
    ).execute();
  }
}
