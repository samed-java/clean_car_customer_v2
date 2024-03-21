import 'package:clean_car_customer_v2/components/custom_button.dart';
import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:clean_car_customer_v2/features/profile_section/reservation_details/cubit/change_status_cubit.dart';
import 'package:clean_car_customer_v2/features/profile_section/reservation_details/widgets/reservation_detail_card.dart';
import 'package:clean_car_customer_v2/features/profile_section/reservations/data/model/reservations_model.dart'
as m;
import 'package:clean_car_customer_v2/utils/extensions/locale_extension/locale_extension.dart';
import 'package:clean_car_customer_v2/utils/map/map_opener.dart';
import 'package:clean_car_customer_v2/utils/pager/go.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../../../utils/pager/pager.dart';
import '../../../branches_and_reservation/reservation/data/model/res/reservation_parameters_res_model.dart';
import '../../my_cars/data/model/res/my_cars_res_model.dart';

class ReservationDetailContent extends StatelessWidget {
  const ReservationDetailContent({super.key,
    required this.isNew,
    required this.branch,
    required this.car,
    required this.service,
    required this.date,
    required this.time,
    this.canDelete = false,
    this.reservation,
    this.onSubmit});

  final bool isNew;
  final bool canDelete;
  final Branch branch;
  final Car car;
  final Service service;
  final DateTime date;
  final Time time;
  final Function? onSubmit;
  final m.Active? reservation;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          ReservationDetailCard(
            onTap: () {
              MapOpener.open(
                  context: context,
                  lat: double.parse(branch.lat),
                  long: double.parse(branch.lon));
            },
            headerText: context.locale.address,
            content: Row(
              children: [
                SvgPicture.asset(IconAssets.location),
                Gaps.w4,
                Expanded(
                    child: Text(
                      "${branch.washingName} ${branch.address}",
                      overflow: TextOverflow.ellipsis,
                      style: getMediumStyle(
                        color: ColorManager.secondaryBlack,
                        fontSize: 14,
                      ).copyWith(decoration: TextDecoration.underline),
                    )),
              ],
            ),
          ),
          Gaps.h16,
          ReservationDetailCard(
            content: Text(
              "${car.carModel}, ${car.carNumber} ",
              style: getMediumStyle(
                color: ColorManager.secondaryBlack,
                fontSize: 14,
              ),
            ),
            headerText: context.locale.vehiclenameandnumber,
          ),
          Gaps.h16,
          ReservationDetailCard(
            content: Text(
              service.title,
              style: getMediumStyle(
                color: ColorManager.secondaryBlack,
                fontSize: 14,
              ),
            ),
            headerText: context.locale.service,
          ),
          Gaps.h16,
          ReservationDetailCard(
            content: Text(
              "${DateFormat("dd.MM.yyyy").format(date)}  ${time.time}",
              style: getMediumStyle(
                color: ColorManager.secondaryBlack,
                fontSize: 14,
              ),
            ),
            headerText: context.locale.dateandtime,
          ),
          Gaps.h16,
          Gaps.h16,
          ReservationDetailCard(
            content: Text(
              "${service.price} AZN",
              style: getMediumStyle(
                color: ColorManager.secondaryBlack,
                fontSize: 14,
              ),
            ),
            headerText: context.locale.price,
          ),
          Gaps.h16,
          if (isNew) ...[
            Gaps.h12,
            CustomButton(
              frontText: context.locale.confirm,
              onPressed: () {
                onSubmit?.call();
              },
            )
          ],
          if (!isNew) ...[
            reservation!.status == "1"
                ? BlocListener<ChangeStatusCubit, ChangeStatusState>(
              listener: (context, state) {
                if(state is ChangeStatusSuccess) {
                  Go.to(Pager.splash(
                      svgAssets: ImageAssets.confirmed,
                      headerText: "${(context.read<ChangeStatusCubit>().currentStatus??0)==2?
                          context.locale.cancelled
                          : context.locale.confirmed}!!!",
                      subText:
                      context.locale.cancel_action,
                      backCount: 2
                  ));
                }
              },
              child: CustomButton(
                frontText: context.locale.toCancel,
                onPressed: () {
                  context.read<ChangeStatusCubit>().changeStatus(
                    reservation!,
                    2,
                  );
                },
                backgroundColor: ColorManager.mainBackgroundColor,
                foregroundColor: ColorManager.mainRed,
                borderColor: ColorManager.mainRed,
              ),
            )
                : Gaps.empty,
            Gaps.h12,
            reservation!.status == "1"
                ? CustomButton(
              frontText: context.locale.makechange,
              onPressed: () {
                onSubmit?.call();
              },
            )
                : CustomButton(
              frontText: context.locale.refresh,
              onPressed: () {
                onSubmit?.call();
              },
            )
          ],
          Gaps.h16
        ],
      ),
    );
  }
}
