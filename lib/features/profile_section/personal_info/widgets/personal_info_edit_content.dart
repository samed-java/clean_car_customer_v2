import 'package:clean_car_customer_v2/components/custom_button.dart';
import 'package:clean_car_customer_v2/components/custom_textfield_widget.dart';
import 'package:clean_car_customer_v2/constants/res/gaps.dart';
import 'package:clean_car_customer_v2/features/profile_section/personal_info/cubit/profile_info/profile_info_cubit.dart';
import 'package:clean_car_customer_v2/features/profile_section/personal_info/cubit/profile_info/profile_info_state.dart';
import 'package:clean_car_customer_v2/features/profile_section/personal_info/widgets/personal_info_card.dart';
import 'package:clean_car_customer_v2/utils/extensions/locale_extension/locale_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:string_mask/string_mask.dart';

import '../../../../constants/res/color_manager.dart';
import '../../../../constants/res/styles_manager.dart';

class PersonalInfoEditContent extends StatelessWidget {
  const PersonalInfoEditContent({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProfileInfoCubit>();
    return BlocBuilder<ProfileInfoCubit, ProfileInfoState>(
      builder: (context, state) {
        if (state is ProfileInfoSuccess) {
          return Column(
            children: [
              Gaps.h8,
              TextFieldWidget(
                headerText: context.locale.fullname,
                controller: cubit.name,
              ),
              Gaps.h16,
              TextFieldWidget(
                headerText: context.locale.email,
                controller: cubit.email,
              ),
              Gaps.h16,
              TextFieldWidget(
                headerText: context.locale.phonenumber,
                controller: cubit.phone,
                inputFormatters: [
                  MaskTextInputFormatter(mask: "+###-##-###-##-##")
                ],
              ),
              Gaps.h16,
              CustomButton(
                  frontText: context.locale.remember, onPressed: () => cubit.updateData()),
              Gaps.h16,
              CustomButton(
                frontText: context.locale.delete,
                onPressed: () => cubit.deleteAccount(),
                backgroundColor: ColorManager.mainBackgroundColor,
                borderColor: ColorManager.mainRed,
                foregroundColor: ColorManager.mainRed,
              ),
              Gaps.h16,
            ],
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
