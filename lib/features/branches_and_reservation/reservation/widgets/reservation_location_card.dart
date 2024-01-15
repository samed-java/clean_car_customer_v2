import 'package:animate_do/animate_do.dart';
import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:clean_car_customer_v2/features/branches_and_reservation/reservation/cubit/reservation_cubit.dart';
import 'package:clean_car_customer_v2/features/branches_and_reservation/reservation/data/model/res/reservation_parameters_res_model.dart';
import 'package:clean_car_customer_v2/features/branches_and_reservation/reservation/widgets/choose_car_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bounce/flutter_bounce.dart' as bounce;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReservationLocationCard extends StatelessWidget {
  const ReservationLocationCard({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ReservationCubit>();
    return StreamBuilder<ReservationParametersResModel>(
        stream: cubit.params,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return bounce.Bounce(
              onPressed: () {
                chooseBranch(context,
                    branchs: snapshot.data!.washings!,
                    selected: cubit.selectedBranch.value,
                    onSelect: (value) {
                      cubit.selectBranch(value);
                    });
              },
              duration: const Duration(milliseconds: 100),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: ColorManager.mainWhite,
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: Padding(
                  padding: Paddings.all16,
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 24.r,
                        backgroundColor: ColorManager.mainBackgroundColor,
                        child: SvgPicture.asset(
                          IconAssets.location,
                          height: 24.h,
                          width: 24.w,
                        ),
                      ),
                      Gaps.w8,
                      ValueListenableBuilder<Branch?>(
                          valueListenable: cubit.selectedBranch,
                          builder: (context, value, child) {
                            if (value != null) {
                              return SizedBox(
                                width: 220.w,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      value.washingName,
                                      overflow: TextOverflow.ellipsis,
                                      style: getMediumStyle(
                                          color: ColorManager.mainBlack,
                                          fontSize: 14),
                                    ),
                                    Text(
                                      value.address,
                                      overflow: TextOverflow.ellipsis,
                                      style: getMediumStyle(
                                          color: ColorManager.mainBlack,
                                          fontSize: 12),
                                    ),
                                  ],
                                ),
                              );
                            } else {
                              return Text(
                                "Filial secin",
                                style: getMediumStyle(
                                    color: ColorManager.mainBlack,
                                    fontSize: 14),
                              );
                            }
                          }),
                      Expanded(child: Gaps.empty),
                      bounce.Bounce(
                        onPressed: () {
                          chooseBranch(context,
                              branchs: snapshot.data!.washings!,
                              selected: cubit.selectedBranch.value,
                              onSelect: (value) {
                            cubit.selectBranch(value);
                          });
                        },
                        duration: const Duration(milliseconds: 100),
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 8.h),
                          child: SizedBox(
                            child: Padding(
                              padding: Paddings.all4,
                              child: SvgPicture.asset(
                                IconAssets.pencil,
                                height: 16.h,
                                width: 16.w,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return const ReservationContentLoading();
          }
        });
  }
}

class ReservationContentLoading extends StatelessWidget {
  const ReservationContentLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
    //   SizedBox(
    //   width: 1.sw,
    //   height: 100.h,
    //   child: const Center(
    //     child: CupertinoActivityIndicator(),
    //   ),
    // );
  }
}
