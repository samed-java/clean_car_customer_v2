import 'package:clean_car_customer_v2/components/custom_button.dart';
import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:clean_car_customer_v2/features/branches_and_reservation/branch/widgets/branch_car_type.dart';
import 'package:clean_car_customer_v2/features/branches_and_reservation/branch/widgets/branch_info.dart';
import 'package:clean_car_customer_v2/features/branches_and_reservation/branch/widgets/branch_note.dart';
import 'package:clean_car_customer_v2/features/branches_and_reservation/branch/widgets/branch_upper.dart';
import 'package:clean_car_customer_v2/features/branches_and_reservation/reservation/data/model/res/reservation_parameters_res_model.dart';
import 'package:clean_car_customer_v2/utils/extensions/locale_extension/locale_extension.dart';
import 'package:clean_car_customer_v2/utils/map/map_opener.dart';
import 'package:clean_car_customer_v2/utils/pager/go.dart';
import 'package:clean_car_customer_v2/utils/pager/pager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../home/data/model/res/branchs_res_model.dart' as wash;

class BranchScreen extends StatefulWidget {
  const BranchScreen({Key? key, required this.model}) : super(key: key);

  final wash.Washing model;

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
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: '${widget.model.id}-${widget.model.title}',
                child: BranchUpper(
                  model: widget.model,
                ),
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
                            widget.model.title,
                            // overflow: TextOverflow.ellipsis,
                            style: getSemiBoldStyle(
                                color: ColorManager.secondaryBlack,
                                fontSize: 18),
                          ),
                        ),
                      BranchInfoWidget(
                        model: widget.model,
                      ),
                      Gaps.h16,
                      ClipRRect(
                        borderRadius:
                            BorderRadius.all(RadiusManager.radiusCircular6),
                        child: SizedBox(
                          height: (widget.model.services?.isNotEmpty ?? false)
                              ? 300.h
                              : 0,
                          child: BranchCarType(
                            services: widget.model.services,
                          ),
                        ),
                      ),
                      Gaps.h16,
                      BranchNoteWidget(
                        model: widget.model,
                      ),
                      Gaps.h24,
                      CustomButton(
                        frontText: context.locale.seemapp,
                        onPressed: () {
                          MapOpener.open(
                              context: context,
                              lat: double.parse(widget.model.lat),
                              long: double.parse(widget.model.lon));
                        },
                        foregroundColor: ColorManager.mainBlue,
                        backgroundColor: ColorManager.mainBackgroundColor,
                      ),
                      Gaps.h16,
                      CustomButton(
                          frontText: context.locale.makereservation,
                          onPressed: () {
                            Go.to(Pager.reservation(
                                branch: Branch(
                              id: widget.model.id,
                              washingName: widget.model.title,
                              address: widget.model.address,
                              lat: widget.model.lat,
                              lon: widget.model.lon,
                            )));
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
                    InkWell(
                      onTap: () {
                        Go.back();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset(IconAssets.backButton),
                      ),
                    ),
                    Gaps.w16,
                    Expanded(
                      child: Text(
                        widget.model.title,
                        overflow: TextOverflow.ellipsis,
                        style: getSemiBoldStyle(
                            color: ColorManager.secondaryBlack, fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : null,
    );
  }
}
