import 'dart:math';

import 'package:clean_car_customer_v2/constants/res/color_manager.dart';
import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../data/model/res/reservation_parameters_res_model.dart';

class ServiceExpandedList extends StatefulWidget {
  const ServiceExpandedList(
      {super.key,
      required this.services,
      required this.init,
      required this.onChange});
  final List<Service> services;
  final Service? init;
  final Function(Service) onChange;

  @override
  State<ServiceExpandedList> createState() => _ServiceExpandedLIstState();
}

class _ServiceExpandedLIstState extends State<ServiceExpandedList> {
  Service? selected;
  bool expanded = false;
  String? query;

  @override
  void initState() {
    selected = widget.init;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // duration: DurationConstant.ms100,
      width: 1.sw,
      // height: 40 + (expanded ? (48 * widget.services.length.toDouble()) : 0),
      decoration: BoxDecoration(
        color: ColorManager.mainWhite,
        borderRadius: BorderRadius.only(
            topRight: RadiusManager.radiusCircular6,
            topLeft: RadiusManager.radiusCircular6,
            bottomRight:
                !expanded ? RadiusManager.radiusCircular6 : Radius.zero,
            bottomLeft:
                !expanded ? RadiusManager.radiusCircular6 : Radius.zero),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                expanded = true;
              });
            },
            child: AnimatedContainer(
              duration: DurationConstant.ms100,
              width: 1.sw,
              height: 40,
              padding: Paddings.all8,
              decoration: BoxDecoration(
                color: ColorManager.mainWhite,
                borderRadius: BorderRadius.only(
                    topRight: RadiusManager.radiusCircular6,
                    topLeft: RadiusManager.radiusCircular6,
                    bottomRight:
                        !expanded ? RadiusManager.radiusCircular6 : Radius.zero,
                    bottomLeft: !expanded
                        ? RadiusManager.radiusCircular6
                        : Radius.zero),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (selected != null && !expanded)
                    Expanded(
                        child: Text(
                      selected!.title,
                      overflow: TextOverflow.ellipsis,
                      style: getRegularStyle(
                          color: ColorManager.secondaryBlack,
                          fontSize: FontSize.s14),
                    )),
                  expanded
                      ? Expanded(
                          child: TextFormField(
                            initialValue: selected?.title ?? '',
                            style: getRegularStyle(
                                color: ColorManager.secondaryBlack,
                                fontSize: FontSize.s14),
                            onChanged: (text) {
                              setState(() {
                                query = text;
                              });
                            },
                          ),
                        )
                      : 0.horizontalSpace,
                  16.horizontalSpace,
                  InkWell(
                    onTap: () {
                      setState(() {
                        expanded = !expanded;
                      });
                    },
                    child: AnimatedRotation(
                      turns: expanded ? 0.5 : 0,
                      duration: DurationConstant.ms100,
                      child: Transform.rotate(
                          angle: pi / 2,
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: ColorManager.thirdBlack,
                            size: 20,
                          )),
                    ),
                  )
                ],
              ),
            ),
          ),
          // if (expanded)
          AnimatedContainer(
            duration: DurationConstant.ms100,
            width: 1.sw,
            height: expanded
                ? (64 *
                    (query != null
                            ? widget.services.where((element) => element.title
                                .toLowerCase()
                                .contains(query!.toLowerCase()))
                            : widget.services)
                        .length
                        .toDouble())
                : 0,
            decoration: BoxDecoration(
              color: ColorManager.mainWhite,
              borderRadius: BorderRadius.only(
                  bottomRight: RadiusManager.radiusCircular6,
                  bottomLeft: RadiusManager.radiusCircular6),
            ),
            child: SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: Column(
                children: [
                  ...(query != null
                          ? widget.services.where((element) => element.title
                              .toLowerCase()
                              .contains(query!.toLowerCase()))
                          : widget.services)
                      .map((e) => InkWell(
                            onTap: () {
                              setState(() {
                                widget.onChange.call(e);
                                selected = e;
                                expanded = false;
                              });
                            },
                            child: Container(
                              width: 1.sw,
                              height: 64,
                              padding: Paddings.all8,
                              decoration: BoxDecoration(
                                  border: Border(
                                top: BorderSide(
                                    color:
                                        ColorManager.mainBlack.withOpacity(.1)),
                              )),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                      child: Text(
                                    e.title,
                                    // overflow: TextOverflow.ellipsis,
                                    style: getRegularStyle(
                                        color: ColorManager.secondaryBlack,
                                        fontSize: FontSize.s14),
                                  )),
                                  16.horizontalSpace,
                                  Text(
                                    "${e.price} AZN",
                                    overflow: TextOverflow.ellipsis,
                                    style: getRegularStyle(
                                        color: ColorManager.secondaryBlack,
                                        fontSize: FontSize.s14),
                                  )
                                ],
                              ),
                            ),
                          ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
