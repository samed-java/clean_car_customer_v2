// ignore_for_file: must_be_immutable

import 'package:clean_car_customer_v2/components/custom_button.dart';
import 'package:clean_car_customer_v2/components/custom_searchbar.dart';
import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:clean_car_customer_v2/features/campaigns/data/model/res/campaigns_res_model.dart';
import 'package:clean_car_customer_v2/utils/converters/campaing_converter.dart';
import 'package:clean_car_customer_v2/utils/extensions/locale_extension/locale_extension.dart';
import 'package:clean_car_customer_v2/utils/pager/go.dart';
import 'package:clean_car_customer_v2/utils/pager/pager.dart';
import 'package:clean_car_customer_v2/utils/services/navigation_service/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CampaignBranchesSheet {
  static void showCampaignBranches({
    required Campaign campaign,
  }) async {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: RadiusManager.radiusCircular16,
                topRight: RadiusManager.radiusCircular16)),
        backgroundColor: ColorManager.mainBackgroundColor,
        context: NavigationService.instance.context,
        builder: (context) {
          return _CampaignBranchesContent(
            campaign: campaign,
          );
        });
  }
}

class _CampaignBranchesContent extends StatefulWidget {
  const _CampaignBranchesContent({
    required this.campaign,
  });

  final Campaign campaign;

  @override
  State<_CampaignBranchesContent> createState() =>
      _CampaignBranchesContentState();
}

class _CampaignBranchesContentState extends State<_CampaignBranchesContent> {
  CampaignWashing? _selectedBranch;
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  List<CampaignWashing> _filteredBranches = [];

  @override
  void initState() {
    super.initState();
    _filteredBranches = widget.campaign.washings ?? [];
    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredBranches = widget.campaign.washings!
          .where((branch) => (branch.title ?? '').toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void onReserveAction() {
    if (_selectedBranch != null) {
      Go.to(
        Pager.reservation(
            branch: branchConverted(_selectedBranch),
            service: serviceConverter(widget.campaign.services!.first)),
      );
      return;
    }
  }

  void onTap(CampaignWashing branch) {
    if (branch.id == _selectedBranch?.id) {
      _selectedBranch = null;
    } else {
      _selectedBranch = branch;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight * 0.95,
            ),
            child: IntrinsicHeight(
              child: Container(
                padding: Paddings.all16,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          context.locale.branches,
                          style: getSemiBoldStyle(
                            color: ColorManager.mainBlue,
                            fontSize: FontSize.s18,
                          ),
                        ),
                        Bounce(
                          duration: DurationConstant.ms100,
                          onPressed: () => Go.back(),
                          child: Icon(
                            Icons.close,
                            color: ColorManager.mainBlack,
                            size: 20.sp,
                          ),
                        ),
                      ],
                    ),
                    16.verticalSpace,
                    Container(
                      padding: Paddings.all8,
                      constraints: BoxConstraints(maxHeight: 650.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          RadiusManager.radiusCircular6,
                        ),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              width: 1.sw,
                              child: CustomSearchBar(
                                searchController: _searchController,
                                focusNode: _focusNode,
                                hintText: 'Search',
                              ),
                            ),
                            ...List.generate(_filteredBranches.length, (index) {
                              final branch = _filteredBranches[index];
                              return Padding(
                                padding: const EdgeInsets.only(top: 16),
                                child: Bounce(
                                  onPressed: () => onTap(branch),
                                  duration: DurationConstant.ms100,
                                  child: _BranchItem(
                                    branch: branch,
                                    isSelected:
                                        _selectedBranch?.id == branch.id,
                                  ),
                                ),
                              );
                            }),
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                    CustomButton(
                      frontText: context.locale.makereservation,
                      onPressed: onReserveAction,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _BranchItem extends StatelessWidget {
  const _BranchItem({required this.branch, required this.isSelected});

  final CampaignWashing branch;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorManager.mainWhite,
        borderRadius: BorderRadius.all(RadiusManager.radiusCircular6),
        border: isSelected ? Border.all(color: ColorManager.mainBlue) : null,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
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
            8.horizontalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  branch.title!,
                  overflow: TextOverflow.ellipsis,
                  style: getUnderlineStyle(
                    color: ColorManager.mainBlack,
                    fontWeight: FontWeight.w500,
                    fontSize: FontSize.s14,
                  ),
                ),
                // Text(
                //   branch.distance,
                //   overflow: TextOverflow.ellipsis,
                //   style: getMediumStyle(
                //     color: ColorManager.thirdBlack,
                //     fontSize: FontSize.s12,
                //   ),
                // )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
