import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:clean_car_customer_v2/features/profile_section/settings/features/contacts/data/repo/contacts_repo.dart';
import 'package:clean_car_customer_v2/locator.dart';
import 'package:clean_car_customer_v2/utils/errors/base_error_handler.dart';
import 'package:meta/meta.dart';

import '../../../../../../utils/errors/errors.dart';
import '../data/model/res/contacts_res_model.dart';

part 'contacts_state.dart';

class ContactsCubit extends Cubit<ContactsState> with BaseErrorHandler{
  ContactsCubit() : super(ContactsInitial());

  @override
  Future<void> onProgress() async{
    emit(ContactsLoading());
    var result = await locator.get<ContacsRepository>().fetch();
    emit(ContactsSuccess(result.contacts));
  }

  @override
  void onSocketException(SocketException e) {
    emit(ContactsFail("Network error"));
    super.onSocketException(e);
  }

  @override
  void onDataIsNullError(DataIsNullError e) {
    emit(ContactsFail());
    super.onDataIsNullError(e);
  }

  @override
  void onNotSuccessError(NotSuccessError e) {
    emit(ContactsFail());
    super.onNotSuccessError(e);
  }

  @override
  void onResponseBodyIsNullError(ResponseBodyIsNullError e) {
    emit(ContactsFail());
    super.onResponseBodyIsNullError(e);
  }

  @override
  void onOtherError(Object e, StackTrace s) {
    print(e);
    print(s);
    emit(ContactsFail());
    super.onOtherError(e, s);
  }
}
