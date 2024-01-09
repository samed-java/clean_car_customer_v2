part of 'languages_cubit.dart';

@immutable
abstract class LanguagesState {}

class LanguagesInitial extends LanguagesState {}
class LanguagesLoading extends LanguagesState {}
class LanguagesSuccess extends LanguagesState {
  final LanguagesResModel data;
  LanguagesSuccess(this.data);
}
class LanguagesFail extends LanguagesState {}
