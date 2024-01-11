part of 'contacts_cubit.dart';

@immutable
abstract class ContactsState {}

class ContactsInitial extends ContactsState {}
class ContactsLoading extends ContactsState {}
class ContactsSuccess extends ContactsState {
  final List<Contact> list;
  ContactsSuccess(this.list);
}
class ContactsFail extends ContactsState {
  final String? message;
  ContactsFail([this.message]);
}
