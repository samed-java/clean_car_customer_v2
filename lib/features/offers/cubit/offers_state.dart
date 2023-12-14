part of 'offers_cubit.dart';

abstract class OffersState {}

class OffersInitial extends OffersState {}

class OffersLoading extends OffersState {}

class OffersSuccess extends OffersState {
  final OfferResModel data;
  OffersSuccess({required this.data});
}

class OffersFail extends OffersState {
  final String? message;
  OffersFail({this.message});
}
