part of 'change_status_cubit.dart';

abstract class ChangeStatusState {}

class ChangeStatusInitial extends ChangeStatusState {}

class ChangeStatusLoading extends ChangeStatusState {}

class ChangeStatusSuccess extends ChangeStatusState {}

class ChangeStatusFailed extends ChangeStatusState {}
