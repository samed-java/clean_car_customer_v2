import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../components/custom_searchbar.dart';
import '../../../../constants/res/asset_manager.dart';
import '../../../../constants/res/color_manager.dart';
import '../../../../constants/res/paddings.dart';
import '../../../../constants/res/styles_manager.dart';
import '../../../../utils/pager/go.dart';
import '../data/model/res/reservation_parameters_res_model.dart';
import 'choose_car_radio_button.dart';

class ChooseBranchContent extends StatefulWidget {
  const ChooseBranchContent(
      {super.key,
      required this.branchs,
      required this.onSelect,
      required this.selected});
  final List<Branch> branchs;
  final Branch? selected;
  final Function(Branch) onSelect;

  @override
  State<ChooseBranchContent> createState() => _ChooseBranchContentState();
}

class _ChooseBranchContentState extends State<ChooseBranchContent> {
  late final TextEditingController searchController;
  late ValueNotifier<List<Branch>> branchs;
  late Branch? selected;

  @override
  void initState() {
    selected = widget.selected;
    searchController = TextEditingController();
    branchs = ValueNotifier(widget.branchs);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ChooseBranchContent oldWidget) {
    selected = widget.selected;
    super.didUpdateWidget(oldWidget);
  }

  void getSearchedBranch(String key) {
    branchs.value = widget.branchs
        .where((element) =>
            element.washingName.toLowerCase().contains(key) ||
            element.address.toLowerCase().contains(key))
        .toList();
    branchs.notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Filial seçin",
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
            16.verticalSpace,
            SizedBox(
              height: 40.h,
              width: 1.sw,
              child: CustomSearchBar(
                focusNode: FocusNode(),
                searchController: searchController,
                onChange: (key) {
                  getSearchedBranch(key);
                },
              ),
            ),
            16.verticalSpace,
            ValueListenableBuilder(
                valueListenable: branchs,
                builder: (context, value, child) {
                  return ChooseBranchRadioButton(
                    branchs: value,
                    onSelect: (branch) async {
                      widget.onSelect.call(branch);
                      await Future.delayed(DurationConstant.ms300);
                      Go.back();
                    },
                    selected: widget.selected,
                  );
                }),
          ],
        ),
      ),
    );
  }
}
