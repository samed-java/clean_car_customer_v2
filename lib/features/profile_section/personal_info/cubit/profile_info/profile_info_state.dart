abstract class ProfileInfoState{}

class ProfileInfoInitial extends ProfileInfoState{}

class ProfileInfoLoading extends ProfileInfoState{}

class ProfileInfoSuccess extends ProfileInfoState{
  final ProfileInfoResModel profileInfoModel;
  ProfileInfoSuccess(this.profileInfoModel);
}

class ProfileInfoErrorState extends ProfileInfoState{
  final String error;
  ProfileInfoErrorState(this.error);
}


