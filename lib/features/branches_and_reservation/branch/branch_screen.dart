import 'package:clean_car_customer_v2/components/custom_button.dart';
import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:clean_car_customer_v2/features/branches_and_reservation/branch/widgets/banch_car_type.dart';
import 'package:clean_car_customer_v2/features/branches_and_reservation/branch/widgets/branch_info.dart';
import 'package:clean_car_customer_v2/features/branches_and_reservation/branch/widgets/branch_note.dart';
import 'package:clean_car_customer_v2/features/branches_and_reservation/branch/widgets/branch_upper.dart';
import 'package:clean_car_customer_v2/utils/pager/go.dart';
import 'package:clean_car_customer_v2/utils/pager/pager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BranchScreen extends StatefulWidget {
  const BranchScreen({Key? key}) : super(key: key);

  @override
  State<BranchScreen> createState() => _BranchScreenState();
}

class _BranchScreenState extends State<BranchScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _showAppBar = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        _showAppBar = _scrollController.offset > 300.h;
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        // physics: const BouncingScrollPhysics(),
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            backgroundColor: ColorManager.mainBackgroundColor,
            expandedHeight: 300.h,
            floating: false,
            pinned: false,
            flexibleSpace: const FlexibleSpaceBar(
              background: Hero(
                tag: "salam",
                child: BranchUpper(),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: Paddings.horizontal16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (!_showAppBar)
                        Padding(
                          padding: Paddings.vertical16,
                          child: Text(
                            "Nizami filialı",
                            style: getSemiBoldStyle(
                                color: ColorManager.secondaryBlack,
                                fontSize: 18),
                          ),
                        ),
                      const BranchInfoWidget(),
                      Gaps.h16,
                      ClipRRect(
                        borderRadius:
                            BorderRadius.all(RadiusManager.radiusCircular6),
                        child: const SizedBox(
                          height: 200,
                          child: BranchCarType(),
                        ),
                      ),
                      Gaps.h16,
                      const BranchNoteWidget(),
                      Gaps.h24,
                      CustomButton(
                        frontText: "Xəritədə Bax",
                        onPressed: () {},
                        foregroundColor: ColorManager.mainBlue,
                        backgroundColor: ColorManager.mainBackgroundColor,
                      ),
                      Gaps.h16,
                      CustomButton(
                          frontText: "Rezerv Et",
                          onPressed: () {
                            Go.to(Pager.reservation());
                          }),
                      SizedBox(
                        height: 50.h,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      appBar: _showAppBar
          ? AppBar(
              automaticallyImplyLeading: false,
              elevation: 0,
              backgroundColor: ColorManager.mainBackgroundColor,
              title: Padding(
                padding: Paddings.all10,
                child: Row(
                  children: [
                    Image.asset(IconAssets.backButton),
                    Gaps.w16,
                    Text(
                      "Nizami filialı",
                      style: getSemiBoldStyle(
                          color: ColorManager.secondaryBlack, fontSize: 18),
                    ),
                  ],
                ),
              ),
            )
          : null,
    );
  }
}
