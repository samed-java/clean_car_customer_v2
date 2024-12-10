part of 'campaigns_cubit.dart';

abstract class CampaignsState {}

class CampaignsInitial extends CampaignsState {}

class CampaignsLoading extends CampaignsState {}

class CampaignsSuccess extends CampaignsState {
  final CampaignResModel data;
  CampaignsSuccess({required this.data});
}

class CampaignsFail extends CampaignsState {
  final String? message;
  CampaignsFail({this.message});
}
