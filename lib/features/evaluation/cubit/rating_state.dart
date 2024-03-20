part of 'rating_cubit.dart';

@immutable
sealed class RatingState {}

final class RatingInitial extends RatingState {}
final class RatingLoading extends RatingState {}
final class RatingSuccess extends RatingState {}
final class RatingFail extends RatingState {}
