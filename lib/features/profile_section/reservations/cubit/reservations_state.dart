part of 'reservations_cubit.dart';

abstract class ReservationsState {}

class ReservationsInitial extends ReservationsState {}

class ReservationsLoading extends ReservationsState {}

class ReservationsSuccess extends ReservationsState {
  final ReservationsResModel reservationsModel;
  ReservationsSuccess(this.reservationsModel);
}

class ReservationsErrorState extends ReservationsState {
  final String error;
  ReservationsErrorState(this.error);
}
