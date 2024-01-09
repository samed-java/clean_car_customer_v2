import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../profile_section/my_cars/data/model/res/my_cars_res_model.dart';
import '../data/model/res/reservation_parameters_res_model.dart';

class ChooseBranchRadioButton extends StatefulWidget {
  const ChooseBranchRadioButton(
      {super.key,
      required this.branchs,
      required this.onSelect,
      required this.selected});
  final List<Branch> branchs;
  final Branch? selected;
  final Function(Branch) onSelect;

  @override
  State<ChooseBranchRadioButton> createState() =>
      _ChooseBranchRadioButtonState();
}

class _ChooseBranchRadioButtonState extends State<ChooseBranchRadioButton> {
  late Branch? selectedRadio;

  @override
  void initState() {
    selectedRadio = widget.selected;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Gaps.h12,
          SizedBox(
            height: 350.h,
            child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        widget.onSelect.call(widget.branchs.elementAt(index));
                        setState(() {
                          selectedRadio = widget.branchs.elementAt(index);
                        });
                      },
                      child: Container(
                        padding: Paddings.all10,
                        decoration: BoxDecoration(
                          color: ColorManager.mainWhite,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 220.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.branchs.elementAt(index).washingName,
                                    overflow: TextOverflow.ellipsis,
                                    style: getMediumStyle(
                                        color: ColorManager.mainBlack,
                                        fontSize: 14),
                                  ),
                                  Text(
                                    widget.branchs.elementAt(index).address,
                                    overflow: TextOverflow.ellipsis,
                                    style: getMediumStyle(
                                        color: ColorManager.secondaryBlack,
                                        fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(child: Gaps.empty),
                            Transform.scale(
                              scale: 1.4,
                              child: Radio<Branch>(
                                value: widget.branchs.elementAt(index),
                                groupValue: selectedRadio,
                                onChanged: (Branch? value) {
                                  setState(() {
                                    selectedRadio = value!;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                separatorBuilder: (context, index) => Gaps.h8,
                itemCount: widget.branchs.length),
          ),
          Gaps.h10,
        ],
      ),
    );
  }
}

class ChooseCarRadioButton extends StatefulWidget {
  const ChooseCarRadioButton(
      {super.key,
      required this.cars,
      required this.onSelect,
      required this.selected});
  final List<Car> cars;
  final Car? selected;
  final Function(Car) onSelect;

  @override
  State<ChooseCarRadioButton> createState() => _ChooseCarRadioButtonState();
}

class _ChooseCarRadioButtonState extends State<ChooseCarRadioButton> {
  late Car? selectedRadio;

  @override
  void initState() {
    selectedRadio = widget.selected;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Gaps.h12,
          SizedBox(
            height: 250.h,
            child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        widget.onSelect.call(widget.cars.elementAt(index));
                        setState(() {
                          selectedRadio = widget.cars.elementAt(index);
                        });
                      },
                      child: Container(
                        padding: Paddings.all10,
                        decoration: BoxDecoration(
                          color: ColorManager.mainWhite,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 24.r,
                              backgroundColor: ColorManager.mainBackgroundColor,
                              child: Center(
                                child: CachedNetworkImage(
                                  imageUrl: widget.cars
                                          .elementAt(index)
                                          .banType
                                          ?.icon ??
                                      "",
                                ),
                              ),
                            ),
                            Gaps.w8,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.cars.elementAt(index).carModel,
                                  style: getMediumStyle(
                                      color: ColorManager.mainBlack,
                                      fontSize: 14),
                                ),
                                Text(
                                  widget.cars.elementAt(index).carNumber,
                                  style: getMediumStyle(
                                      color: ColorManager.secondaryBlack,
                                      fontSize: 12),
                                ),
                              ],
                            ),
                            Expanded(child: Gaps.empty),
                            Transform.scale(
                              scale: 1.4,
                              child: Radio<Car>(
                                value: widget.cars.elementAt(index),
                                groupValue: selectedRadio,
                                onChanged: (Car? value) {
                                  setState(() {
                                    selectedRadio = value!;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                separatorBuilder: (context, index) => Gaps.h8,
                itemCount: widget.cars.length),
          ),
          Gaps.h10,
        ],
      ),
    );
  }
}
