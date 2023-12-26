part of 'my_cars_cubit.dart';

abstract class MyCarsState {}

class MyCarsInitial extends MyCarsState {}
class MyCarsLoading extends MyCarsState {}
class MyCarsSuccess extends MyCarsState {
  CarsResModel data;
  MyCarsSuccess({required this.data});
}
class MyCarsError extends MyCarsState {
  final String? message;
  MyCarsError({this.message});
}
