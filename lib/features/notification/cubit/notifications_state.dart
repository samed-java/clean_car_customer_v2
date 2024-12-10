part of 'notifications_cubit.dart';

abstract class NotificationsState {}

class NotificationsInitial extends NotificationsState {}

class NotificationsLoading extends NotificationsState {}

class NotificationsSuccess extends NotificationsState {
  final NotificationsResModel data;
  NotificationsSuccess({required this.data});
}

class NotificationsFail extends NotificationsState {
  final String? message;
  NotificationsFail({this.message});
}
