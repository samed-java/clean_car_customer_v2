part of 'sign_up_cubit.dart';

@immutable
abstract class SignUpState {}

class SignUpInitial extends SignUpState {}
class SignUpLoading extends SignUpState {}
class SignUpNotRegistered extends SignUpState {}
class SignUpRegistered extends SignUpState {}
class SignUpFailed extends SignUpState {}
