part of 'home_cubit.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  //final BranchsResModel data;
  HomeSuccess(
      //{required this.data}
      );
}

class HomeFail extends HomeState {
  final String message;
  HomeFail({required this.message});
}
