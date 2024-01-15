import 'package:clean_car_customer_v2/components/custom_button.dart';
import 'package:clean_car_customer_v2/components/custom_dropdown_button.dart';
import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:clean_car_customer_v2/components/custom_textfield_widget.dart';
import 'package:clean_car_customer_v2/features/profile_section/my_cars/cubit/my_cars_cubit.dart';
import 'package:clean_car_customer_v2/utils/extensions/locale_extension/locale_extension.dart';
import 'package:clean_car_customer_v2/utils/pager/go.dart';
import 'package:clean_car_customer_v2/utils/services/navigation_service/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

void carInfoDialog(BuildContext c,
    {isNew = false, int? selectedCarId, Function(dynamic)? onFinish}) {
  assert(isNew || selectedCarId != null);
  showDialog(
    context: c,
    builder: (BuildContext context) {
      //GlobalKey<FormState> formKey = GlobalKey<FormState>();
      return AlertDialog(
        backgroundColor: ColorManager.mainBackgroundColor,
        insetPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.r),
        ),
        content: Container(
          width: 320.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.r),
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: c.read<MyCarsCubit>().formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        context.locale.choosecar,
                        style: getSemiBoldStyle(
                          color: ColorManager.mainBlue,
                          fontSize: 18,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Go.back();
                          c.read<MyCarsCubit>().clearData();
                        },
                        child: SizedBox(
                          child: Padding(
                            padding: Paddings.all6,
                            child: SvgPicture.asset(
                              IconAssets.exit,
                              height: 16.h,
                              width: 16.w,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Gaps.h10,
                  Text(
                    context.locale.vehicletype,
                    style: getRegularStyle(
                      color: ColorManager.thirdBlack,
                      fontSize: 14,
                    ),
                  ),
                  Gaps.h2,
                  CustomDropdown<int>(
                    labelText: context.locale.vehicletype,
                    selectedItems: c.read<MyCarsCubit>().selectedBanType,
                    child: (data) => Text(data ?? "------"),
                    validator: (id) {
                      if (id == null) {
                        return "Ban bos ola bilmez";
                      }
                    },
                    items: c.read<MyCarsCubit>().banTypesIdToName,
                    onChanged: (value) {
                      c.read<MyCarsCubit>().selectedBanType = value;
                    },
                  ),
                  Gaps.h16,
                  TextFieldWidget(
                    headerText: context.locale.name,
                    hintText: "Nissan Skyline R35 GTR",
                    controller: c.read<MyCarsCubit>().nameController,
                    validator: (value) {
                      if ((value?.isEmpty) ?? true) {
                        return "Ad bos ola bilmez";
                      }
                    },
                  ),
                  Gaps.h16,
                  TextFieldWidget(
                    headerText: context.locale.number,
                    hintText: "10-OO-001",
                    controller: c.read<MyCarsCubit>().numberController,
                    capitalize: true,
                    inputFormatters: [
                      MaskTextInputFormatter(mask:"##-AA-###")
                    ],
                    validator: (value) {
                      if ((value?.isEmpty) ?? true) {
                        return "Nomre bos ola bilmez";
                      }
                    },
                  ),
                  Gaps.h16,
                  isNew
                      ? Gaps.empty
                      : CustomButton(
                          frontText: context.locale.delete,
                          onPressed: () {
                            c.read<MyCarsCubit>().deleteCar(id: selectedCarId!);
                          },
                          borderColor: ColorManager.mainRed,
                          foregroundColor: ColorManager.mainRed,
                          backgroundColor: ColorManager.mainBackgroundColor,
                        ),
                  Gaps.h10,
                  CustomButton(
                      frontText: context.locale.remember,
                      onPressed: () {
                        // if (c
                        //         .read<MyCarsCubit>()
                        //         .nameController
                        //         .text
                        //         .isNotEmpty &&
                        //     c
                        //         .read<MyCarsCubit>()
                        //         .numberController
                        //         .text
                        //         .isNotEmpty &&
                        //     c.read<MyCarsCubit>().selectedBanType != null) {
                        if (isNew) {
                          c.read<MyCarsCubit>().addCar();
                        } else {
                          c.read<MyCarsCubit>().updateCar(id: selectedCarId!);
                        }
                        //}
                      })
                ],
              ),
            ),
          ),
        ),
      );
    },
  ).then((value) => onFinish?.call(value));
}
