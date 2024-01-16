import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:clean_car_customer_v2/features/home/data/model/res/branchs_res_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BranchCarType extends StatelessWidget {
  const BranchCarType({
    Key? key,
    required this.services,
  }) : super(key: key);

  final List<WashingService> services;

  @override
  Widget build(BuildContext context) {
    return services.isNotEmpty
        ? DefaultTabController(
            length: services.length,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: ColorManager.mainWhite,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(6.r),
                        topRight: Radius.circular(6.r)),
                  ),
                  child: TabBar(
                    isScrollable: services.length == 2 ? false : true,
                    indicatorColor: ColorManager.mainBlue,
                    indicatorWeight: 3,
                    tabs: [
                      ...services.map(
                        (e) => Tab(
                          text: e.ban,
                        ),
                      )
                    ],
                    labelPadding: services.length == 2
                        ? null
                        : EdgeInsets.symmetric(horizontal: 50.w),
                    labelColor: ColorManager.mainBlue,
                    labelStyle: getSemiBoldStyle(
                        color: ColorManager.mainBlue, fontSize: 14),
                    unselectedLabelColor: ColorManager.mainBlack,
                    unselectedLabelStyle: getMediumStyle(
                        color: ColorManager.mainBlack, fontSize: 14),
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    // physics: const BouncingScrollPhysics(),
                    children: [
                      ...services.map(
                        (e) => buildServiceList(e.services),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        : const SizedBox.shrink();
  }

  Widget buildServiceList(List<ServiceService> services) {
    return Container(
      color: ColorManager.mainWhite,
      child: Padding(
        padding: Paddings.horizontal16,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: services.map<Widget>((service) {
            return Text(
              "${service.title} - ${service.price} AZN",
              style:
                  getMediumStyle(color: ColorManager.mainBlack, fontSize: 14),
            );
          }).toList(),
        ),
      ),
    );
  }
}
