import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:clean_car_customer_v2/features/branches_and_reservation/reservation/data/model/res/reservation_parameters_res_model.dart';
import 'package:clean_car_customer_v2/utils/extensions/locale_extension/locale_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../home/data/model/res/branchs_res_model.dart';

class BranchProductsWidget extends StatefulWidget {
  const BranchProductsWidget({super.key, required this.model});

  final Washing model;

  @override
  State<BranchProductsWidget> createState() => _BranchProductsWidgetState();
}

class _BranchProductsWidgetState extends State<BranchProductsWidget> {
  String query = '';
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          // height: 64.h,
          width: double.infinity,
          decoration: BoxDecoration(
              color: ColorManager.mainWhite,
              borderRadius: BorderRadius.all(RadiusManager.radiusCircular6)),
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            cursorColor: ColorManager.thirdBlack,
            onChanged: (value) {
              setState(() {
                query = value;
              });
            },
            decoration: InputDecoration(
              contentPadding: Paddings.all8,
              filled: true,
              fillColor: ColorManager.mainWhite,
              prefixIcon: Image.asset(
                IconAssets.search2,
                height: 16.h,
                width: 16.w,
              ),
              hintText: context.locale.search_oil,
              hintStyle: getRegularStyle(
                  color: ColorManager.fifthBlack, fontSize: FontSize.s14),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(RadiusManager.radiusCircular6),
              ),
            ),
          ),
        ),
        ...[
          16.verticalSpace,
          Container(
            // height: 64.h,
            width: double.infinity,
            decoration: BoxDecoration(
                color: ColorManager.mainWhite,
                borderRadius: BorderRadius.all(RadiusManager.radiusCircular6)),
            child: Padding(
              padding: Paddings.all10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${context.locale.oils}: ',
                    style: getSemiBoldStyle(
                        color: ColorManager.mainBlue, fontSize: 14),
                  ),
                  16.verticalSpace,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...(query.isNotEmpty
                              ? widget.model.products!.where((element) => element
                                  .title
                                  .toLowerCase()
                                  .contains(query.toLowerCase()))
                              : !expanded
                                  ? widget.model.products!.sublist(
                                      0,
                                      widget.model.products!.length > 5
                                          ? 5
                                          : widget.model.products!.length)
                                  : widget.model.products!)
                          .map((e) => SizedBox(
                            width: 1.sw,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  child: Text(
                                        '- ',
                                        style: getRegularStyle(
                                            color: ColorManager.secondaryBlack,
                                            fontSize: FontSize.s14),
                                      ),
                                ),
                                Expanded(
                                  child: Text(
                                        '${e.title}, ${e.value},  ${e.price} AZN',
                                        style: getRegularStyle(
                                            color: ColorManager.secondaryBlack,
                                            fontSize: FontSize.s14),
                                      ),
                                ),
                              ],
                            ),
                          )),
                      if (widget.model.products!.length > 5 && query.isEmpty) ...[
                        16.verticalSpace,
                        InkWell(
                          onTap: () {
                            setState(() {
                              expanded = !expanded;
                            });
                          },
                          child: Text(
                            !expanded
                                ? '${context.locale.all} ${widget.model.products!.length - 5}+ '
                                : "Kiçilt",
                            style: getSemiBoldStyle(
                                color: ColorManager.mainBlue.withOpacity(0.8),
                                fontSize: FontSize.s14),
                          ),
                        )
                      ]
                    ],
                  ),
                ],
              ),
            ),
          ),
        ]
      ],
    );
  }
}
