import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BranchCarType extends StatelessWidget {
  const BranchCarType({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: ColorManager.mainWhite,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(6.r),
                  topRight: Radius.circular(6.r)),
            ),
            child: TabBar(
              indicatorColor: ColorManager.mainBlue,
              indicatorWeight: 3,
              tabs: const [
                Tab(
                  text: 'Sedan',
                ),
                Tab(
                  text: 'Jeep',
                ),
              ],
              labelColor: ColorManager.mainBlue,
              labelStyle:
                  getSemiBoldStyle(color: ColorManager.mainBlue, fontSize: 14),
              unselectedLabelColor: ColorManager.mainBlack,
              unselectedLabelStyle:
                  getMediumStyle(color: ColorManager.mainBlack, fontSize: 14),
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                Container(
                  color: ColorManager.mainWhite,
                  child: Padding(
                    padding: Paddings.horizontal16,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Çölyuma - 7 AZN",
                          style: getMediumStyle(
                              color: ColorManager.mainBlack, fontSize: 14),
                        ),
                        Text(
                          "Kimyəvi təmizləmə - 7 AZN",
                          style: getMediumStyle(
                              color: ColorManager.mainBlack, fontSize: 14),
                        ),
                        Text(
                          "Mühərrik yuma - 7 AZN",
                          style: getMediumStyle(
                              color: ColorManager.mainBlack, fontSize: 14),
                        ),
                        Text(
                          "Avto yuma - 7 AZN",
                          style: getMediumStyle(
                              color: ColorManager.mainBlack, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
                // Content for Tab 2
                Container(
                  decoration: BoxDecoration(
                    color: ColorManager.mainWhite,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(6.r),
                      bottomRight: Radius.circular(6.r),
                    ),
                  ),
                  child: Padding(
                    padding: Paddings.horizontal16,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Çölyuma - 7 AZN",
                          style: getMediumStyle(
                              color: ColorManager.mainBlack, fontSize: 14),
                        ),
                        Text(
                          "Kimyəvi təmizləmə - 7 AZN",
                          style: getMediumStyle(
                              color: ColorManager.mainBlack, fontSize: 14),
                        ),
                        Text(
                          "Mühərrik yuma - 7 AZN",
                          style: getMediumStyle(
                              color: ColorManager.mainBlack, fontSize: 14),
                        ),
                        Text(
                          "Avto yuma - 7 AZN",
                          style: getMediumStyle(
                              color: ColorManager.mainBlack, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
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
