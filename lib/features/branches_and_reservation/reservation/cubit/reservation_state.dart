part of 'reservation_cubit.dart';

@immutable
abstract class ReservationState {}

class ReservationInitial extends ReservationState {}
class ReservationLoading extends ReservationState {}
class ReservationSuccess extends ReservationState {}
class ReservationError extends ReservationState {}
