import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clean_car_customer_v2/features/profile_section/personal_info/cubit/profile_info/profile_info_state.dart';

class ProfileInfoCubit extends Cubit<ProfileInfoState> {
	ProfileInfoCubit() : super(ProfileInfoInitial());
	
	Future<void> getData() async {
		try {
		  emit(ProfileInfoLoading());
	
		  // TODO your code here
	
		  emit(state.copyWith(isLoading: false));
		} catch (error) {
		  emit(state.copyWith(error: error.toString()));
		  emit(stableState.copyWith(isLoading: false));
		}
	}
}
