import 'package:clean_car_customer_v2/constants/res/font_manager.dart';
import 'package:clean_car_customer_v2/constants/res/gaps.dart';
import 'package:clean_car_customer_v2/features/profile_section/personal_info/cubit/profile_info/profile_info_cubit.dart';
import 'package:clean_car_customer_v2/features/profile_section/personal_info/cubit/profile_info/profile_info_state.dart';
import 'package:clean_car_customer_v2/features/profile_section/personal_info/widgets/personal_info_card.dart';
import 'package:clean_car_customer_v2/utils/extensions/locale_extension/locale_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:string_mask/string_mask.dart';

import '../../../../constants/res/color_manager.dart';
import '../../../../constants/res/styles_manager.dart';
import '../../../../data/services/local/storage_service.dart';
import '../../../../utils/snacks/snacks.dart';
import '../../profile/widgets/profile_container.dart';

class PersonalInfoContent extends StatelessWidget {
  const PersonalInfoContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileInfoCubit, ProfileInfoState>(
      builder: (context, state) {
        if (state is ProfileInfoSuccess) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Gaps.h8,
                ProfileContainer(
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: state.profileInfoModel.user.id??'')).then((value){
                      Snacks.showCustomSnack(message: "Copied!",isSucces: true);
                    });
                  },
                  headerText: context.locale.referral_code,
                  suffix: TextButton(
                    onPressed: (){
                      Clipboard.setData(ClipboardData(text: state.profileInfoModel.user.id??'')).then((value){
                        Snacks.showCustomSnack(message: "Copied!",isSucces: true);
                      });
                    }, child: Text("#${state.profileInfoModel.user.id}",style: getMediumStyle(color: ColorManager.mainBlue,fontSize: FontSize.s16),),

                  ),
                ),
                Gaps.h16,
                PersonalInfoCard(
                  headerText: context.locale.name,
                  subText: state.profileInfoModel.user.name??"",
                ),
                Gaps.h16,
                PersonalInfoCard(
                  headerText: context.locale.email,
                  subText: state.profileInfoModel.user.email??"",
                ),
                Gaps.h16,
                PersonalInfoCard(
                  headerText: context.locale.phonenumber,
                  subText: StringMask.apply_(
                      (state.profileInfoModel.user.phone??"").toString(),
                      "+###-##-###-##-##",
                      null),
                ),
                Gaps.h16,
              ],
            ),
          );
        } else if (state is ProfileInfoLoading) {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        } else if (state is ProfileInfoErrorState) {
          return Center(
              child: Text(
            state.error,
            style: getMediumStyle(color: ColorManager.mainBlue, fontSize: 16),
          ));
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
