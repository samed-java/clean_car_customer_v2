import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:clean_car_customer_v2/features/profile_section/reservations/widgets/reservations_info_card.dart';
import 'package:clean_car_customer_v2/utils/enum/status_types.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReservationsTabBar extends StatelessWidget {
  const ReservationsTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    List<StatusType> list1 = [
      StatusType.accepted,
      StatusType.finished,
      StatusType.accepted,
      StatusType.waiting,
      StatusType.rejected,
      StatusType.finished,
      StatusType.waiting
    ];
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Padding(
            padding: Paddings.horizontal16,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6.r),
              child: Container(
                decoration: BoxDecoration(
                  color: ColorManager.mainWhite,
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: TabBar(
                  indicatorColor: HexColor.fromHex("#4283F1"),
                  indicatorWeight: 3,
                  tabs: const [
                    Tab(
                      text: 'Aktiv',
                    ),
                    Tab(
                      text: 'Tarixçə',
                    ),
                  ],
                  labelColor: ColorManager.mainBlue,
                  labelStyle: getSemiBoldStyle(
                      color: ColorManager.mainBlue, fontSize: 14),
                  unselectedLabelColor: ColorManager.mainBlack,
                  unselectedLabelStyle: getMediumStyle(
                      color: ColorManager.mainBlack, fontSize: 14),
                ),
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              physics: const BouncingScrollPhysics(),
              children: [
                Padding(
                  padding: Paddings.all16,
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: list1.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: Paddings.vertical8,
                          child: ReservationInfoCard(
                            statusType: list1[index],
                          ),
                        );
                      }),
                ),
                Padding(
                  padding: Paddings.all16,
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: list1.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: Paddings.vertical8,
                          child: ReservationInfoCard(
                            statusType: list1[index],
                          ),
                        );
                      }),
                ),

                // Content for Tab 3
              ],
            ),
          ),
        ],
      ),
    );
  }
}
