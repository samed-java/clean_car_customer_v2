part of 'faq_cubit.dart';

abstract class FaqState {}

class FaqInitial extends FaqState {}

class FaqLoading extends FaqState {}

class FaqSuccess extends FaqState {
  final FaqResModel data;
  FaqSuccess({required this.data});
}

class FaqFail extends FaqState {
  String? message;
  FaqFail({this.message});
}
