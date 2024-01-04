import 'package:clean_car_customer_v2/components/custom_button.dart';
import 'package:clean_car_customer_v2/components/custom_dropdown_button.dart';
import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:clean_car_customer_v2/features/home/cubit/home_cubit.dart';
import 'package:clean_car_customer_v2/features/home/data/model/res/regions_res_model.dart';
import 'package:clean_car_customer_v2/features/home/widgets/star_box.dart';
import 'package:clean_car_customer_v2/utils/pager/go.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FilterBoxContent extends StatefulWidget {
  const FilterBoxContent({super.key, required this.topContext});
  final BuildContext topContext;
  @override
  State<FilterBoxContent> createState() => _FilterBoxContentState();
}

class _FilterBoxContentState extends State<FilterBoxContent> {
  @override
  Widget build(BuildContext context) {
    final cubit = widget.topContext.read<HomeCubit>();
    cubit.getCities();
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
          child:
              // ValueListenableBuilder<FilterFieldActiveStatus>(
              //     valueListenable: cubit.activeStatus,
              //     builder: (context, value, child) {
              //       return
              Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Filterlə",
                    style: getSemiBoldStyle(
                      color: ColorManager.mainBlue,
                      fontSize: 18,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Go.back();
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
              // Şəhər

              ValueListenableBuilder<int?>(
                  valueListenable: cubit.selectedCity,
                  builder: (context, value, child) {
                    print("rebuild cities");

                    return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Şəhər",
                            style: getRegularStyle(
                              color: ColorManager.thirdBlack,
                              fontSize: 14,
                            ),
                          ),
                          CustomDropdown<int>(
                            items: cubit.cities,
                            child: (item) =>
                                Text((item as Region?)?.title ?? "------"),
                            selectedItems: value,
                            onChanged: (value) {
                              //if (value != null) {
                              cubit.selectedCity.value = value;
                              //cubit.getRegions(value);
                              //}
                            },
                          )
                        ]);
                  }),

              Gaps.h16,
              // Bölgə

              //if (value.city)
              ValueListenableBuilder<int?>(
                  valueListenable: cubit.selectedRegion,
                  builder: (context, value, child) {
                    print("rebuild regions");
                    if (cubit.regions.isNotEmpty) {
                      return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Bölgə",
                              style: getRegularStyle(
                                color: ColorManager.thirdBlack,
                                fontSize: 14,
                              ),
                            ),
                            CustomDropdown<int>(
                              items: cubit.regions,
                              child: (item) =>
                                  Text((item as Region?)?.title ?? "------"),
                              selectedItems: value,
                              onChanged: (value) {
                                //if (value != null) {
                                cubit.selectedRegion.value = value;
                                //cubit.getVillages(value);
                                //}
                              },
                            )
                          ]);
                    }
                    return const SizedBox.shrink();
                  }),

              Gaps.h16,
              // Qəsəbə

              //if (value.village)
              ValueListenableBuilder<int?>(
                  valueListenable: cubit.selectedVillage,
                  builder: (context, value, child) {
                    print("rebuild villages");

                    if (cubit.villages.isNotEmpty) {
                      return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Qəsəbə",
                              style: getRegularStyle(
                                color: ColorManager.thirdBlack,
                                fontSize: 14,
                              ),
                            ),
                            CustomDropdown<int>(
                              items: cubit.villages,
                              child: (item) =>
                                  Text((item as Region?)?.title ?? "------"),
                              selectedItems: value,
                              onChanged: (value) {
                                //if (value != null) {
                                cubit.selectedVillage.value = value;
                                //cubit.getVillages(value);
                                //}
                              },
                            )
                          ]);
                    }
                    return const SizedBox.shrink();
                  }),

              Gaps.h16,
              Text(
                "Xidmət növü",
                style: getRegularStyle(
                  color: ColorManager.thirdBlack,
                  fontSize: 14,
                ),
              ),
              Gaps.h2,
              //const CustomDropDownButton(defaultValue: "Xidmət növü seç"),
              Gaps.h16,
              Text(
                "Qiymətləndirmə",
                style: getRegularStyle(
                  color: ColorManager.thirdBlack,
                  fontSize: 14,
                ),
              ),
              Gaps.h2,
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  StarBox(text: "1"),
                  StarBox(text: "2"),
                  StarBox(text: "3"),
                  StarBox(text: "4"),
                  StarBox(text: "5"),
                ],
              ),
              Gaps.h16,
              CustomButton(frontText: "Qəbul Et", onPressed: () {})
            ],
            //   );
            // }
          ),
        ),
      ),
    );
  }
}
