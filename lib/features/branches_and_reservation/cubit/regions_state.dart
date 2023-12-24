part of 'regions_cubit.dart';

abstract class RegionsState {}

class RegionsInitial extends RegionsState {}

class RegionsLoading extends RegionsState {}

class RegionsSuccess extends RegionsState {
  final RegionResModel data;
  RegionsSuccess({required this.data});
}

class RegionsFail extends RegionsState {
  final String message;
  RegionsFail({required this.message});
}
