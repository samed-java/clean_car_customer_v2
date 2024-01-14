import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:clean_car_customer_v2/features/offers/detailed_offers/widgets/detailed_offers_image.dart';
import 'package:clean_car_customer_v2/features/offers/detailed_offers/widgets/offer_info.dart';
import 'package:clean_car_customer_v2/features/offers/detailed_offers/widgets/offer_widget.dart';
import 'package:clean_car_customer_v2/utils/extensions/locale_extension/locale_extension.dart';
import 'package:clean_car_customer_v2/utils/pager/go.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../data/model/res/offers_res_model.dart';

class DetailedOfferScreen extends StatefulWidget {
  const DetailedOfferScreen({super.key, required this.offer});
  final Offer offer;

  @override
  State<DetailedOfferScreen> createState() => _DetailedOfferScreenState();
}

class _DetailedOfferScreenState extends State<DetailedOfferScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _showAppBar = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        _showAppBar = _scrollController.offset > 200.h;
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
            expandedHeight: 200.h,
            floating: false,
            pinned: false,
            flexibleSpace: FlexibleSpaceBar(
              background: DetailedOfferImage(
                image: widget.offer.image!,
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
                            widget.offer.title ?? context.locale.offer,
                            style: getSemiBoldStyle(
                                color: ColorManager.secondaryBlack,
                                fontSize: 18),
                          ),
                        ),
                      OfferWidget(
                        offerContent: widget.offer.content,
                      ),
                      Gaps.h16,
                      //const OfferInfoWidget(),
                      Gaps.h24,
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
                        child: Image.asset(IconAssets.backButton)),
                    Gaps.w16,
                    Text(
                      widget.offer.title ?? context.locale.offer,
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
