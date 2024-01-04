import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BranchCarType extends StatelessWidget {
  const BranchCarType({
    Key? key,
    required this.services,
  }) : super(key: key);

  final Map<String, dynamic> services;

  @override
  Widget build(BuildContext context) {
    print('====');
    print(services);

    List<Map<String, dynamic>> sedanServices =
        services['Sedan'] ?? <Map<String, dynamic>>[];
    List<Map<String, dynamic>> jeepServices =
        services['Jeep'] ?? <Map<String, dynamic>>[];

    // List<dynamic> sedanServices = [];
    // List<dynamic> jeepServices = [];

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
                buildServiceList(sedanServices),
                buildServiceList(jeepServices),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildServiceList(List<Map<String, dynamic>> services) {
    return Container(
      color: ColorManager.mainWhite,
      child: Padding(
        padding: Paddings.horizontal16,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: services.map<Widget>((service) {
            return Text(
              "${service['title']} - ${service['price']} AZN",
              style:
                  getMediumStyle(color: ColorManager.mainBlack, fontSize: 14),
            );
          }).toList(),
        ),
      ),
    );
  }
}
