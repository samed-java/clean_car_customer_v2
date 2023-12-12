part of 'otp_cubit.dart';

@immutable
abstract class OTPState {}

class OTPInitial extends OTPState {}
class OTPLoading extends OTPState {}
class OTPNotRegistered extends OTPState {}
class OTPRegistered extends OTPState {}
class OTPFailed extends OTPState {}
