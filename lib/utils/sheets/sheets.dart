import 'package:cached_network_image/cached_network_image.dart';
import 'package:cached_video_player_plus/cached_video_player_plus.dart';
import 'package:clean_car_customer_v2/components/custom_button.dart';
import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:clean_car_customer_v2/utils/extensions/locale_extension/locale_extension.dart';
import 'package:clean_car_customer_v2/utils/pager/go.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../features/branches_and_reservation/reservation/data/model/res/reservation_parameters_res_model.dart';
import '../services/navigation_service/navigation_service.dart';

class Sheets {
  Sheets._();

  static void showExtraDetailSheet(
      {required String title,
      required String content,
      String? endDate,
      void Function()? action,
      bool hasAction = false,
      String? actionText,
      Widget? actionIcon,
      MediaType? mediaType,
      String? mediaSource}) async {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: RadiusManager.radiusCircular16,
                topRight: RadiusManager.radiusCircular16)),
        backgroundColor: ColorManager.mainBackgroundColor,
        context: NavigationService.instance.context,
        builder: (context) {
          return ExtraDetailSheetContent(
              title: title,
              hasAction: hasAction,
              content: content,
              actionText: actionText,
              actionIcon: actionIcon,
              mediaType: mediaType,
              mediaSource: mediaSource,
              action: action);
        });
  }

  static void showProductSearchableSheet(
      {required String title, required List<Product> products}) async {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: RadiusManager.radiusCircular16,
                topRight: RadiusManager.radiusCircular16)),
        backgroundColor: ColorManager.mainBackgroundColor,
        context: NavigationService.instance.context,
        builder: (context) {
          return SearchableProductSheetContent(
            title: title,
            products: products,
          );
        });
  }
}

class ExtraDetailSheetContent extends StatefulWidget {
  const ExtraDetailSheetContent({
    super.key,
    required this.title,
    required this.content,
    this.endDate,
    this.action,
    this.actionText,
    this.actionIcon,
    this.mediaType,
    this.mediaSource,
    required this.hasAction,
  });

  final String title;
  final String content;
  final String? endDate;
  final bool hasAction;
  final void Function()? action;
  final String? actionText;
  final Widget? actionIcon;
  final MediaType? mediaType;
  final String? mediaSource;

  @override
  State<ExtraDetailSheetContent> createState() =>
      _ExtraDetailSheetContentState();
}

class _ExtraDetailSheetContentState extends State<ExtraDetailSheetContent> {
  CachedVideoPlayerPlusController? controller;
  bool isMuted = true;

  @override
  void initState() {
    if (widget.mediaType != null &&
        (widget.mediaType == MediaType.assetVideo ||
            widget.mediaType == MediaType.networkVideo)) {
      controller = widget.mediaType == MediaType.networkVideo
          ? CachedVideoPlayerPlusController.networkUrl(
              Uri.parse(widget.mediaSource!))
          : CachedVideoPlayerPlusController.asset(widget.mediaSource!);
    }
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await controller?.initialize();
      if (controller != null && controller!.value.isInitialized) {
        isMuted = true;
        controller!.setLooping(true);
        controller!.setVolume(0);
        controller!.play();
      }
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    controller?.pause();
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        padding: Paddings.all16,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  context.locale.detailed,
                  style: getSemiBoldStyle(
                      color: ColorManager.mainBlue, fontSize: FontSize.s18),
                ),
                Bounce(
                  duration: DurationConstant.ms100,
                  onPressed: () => Go.back(),
                  child: Icon(
                    Icons.close,
                    color: ColorManager.mainBlack,
                    size: 20.sp,
                  ),
                )
              ],
            ),
            16.verticalSpace,
            Container(
              padding: Paddings.all8,
              constraints: BoxConstraints(maxHeight: 600.h),
              decoration: BoxDecoration(
                  color: ColorManager.mainWhite,
                  borderRadius:
                      BorderRadius.all(RadiusManager.radiusCircular6)),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 1.sw,
                      child: Text(
                        widget.title,
                        style: getMediumStyle(
                            color: ColorManager.mainBlack,
                            fontSize: FontSize.s14),
                      ),
                    ),
                    8.verticalSpace,
                    SizedBox(
                      width: 1.sw,
                      child: Text(
                        widget.content,
                        style: getSemiBoldStyle(
                            color: ColorManager.thirdBlack,
                            fontSize: FontSize.s14),
                      ),
                    ),
                    if (widget.mediaType != null) ...[
                      8.verticalSpace,
                      ClipRRect(
                        borderRadius: BorderRadius.all(
                          RadiusManager.radiusCircular6,
                        ),
                        child: Container(
                          width: 1.sw,
                          height: widget.mediaType == MediaType.networkVideo
                              ? 200.h
                              : null,
                          decoration: BoxDecoration(
                              color: ColorManager.mainBackgroundColor,
                              borderRadius: BorderRadius.all(
                                  RadiusManager.radiusCircular6)),
                          child: Builder(
                            builder: (_) {
                              return switch (widget.mediaType) {
                                const (MediaType.networkImage) =>
                                  CachedNetworkImage(
                                    // fit: BoxFit.cover,
                                    imageUrl: widget.mediaSource!,
                                  ),
                                const (MediaType.networkVideo) => Stack(
                                    children: [
                                      controller!.value.isInitialized
                                          ? CachedVideoPlayerPlus(controller!)
                                          : const SizedBox.shrink(),
                                      Positioned(
                                        bottom: 8,
                                        right: 8,
                                        child: Bounce(
                                          onPressed: () async {
                                            await controller!
                                                .setVolume(isMuted ? 1 : 0);
                                            setState(() {
                                              isMuted = !isMuted;
                                            });
                                          },
                                          duration: DurationConstant.ms100,
                                          child: Icon(
                                            isMuted
                                                ? Icons.volume_off
                                                : Icons.volume_up,
                                            color: ColorManager.mainWhite,
                                            size: 25.sp,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                const (MediaType.assetImage) =>
                                  Image.asset(widget.mediaSource!),
                                const (MediaType.assetVideo) =>
                                  controller!.value.isInitialized
                                      ? CachedVideoPlayerPlus(controller!)
                                      : const Center(
                                          child: CupertinoActivityIndicator(),
                                        ),
                                (_) => const SizedBox.shrink(),
                              };
                            },
                          ),
                        ),
                      )
                    ],
                    if (widget.endDate != null) ...[
                      8.verticalSpace,
                      SizedBox(
                        width: 1.sw,
                        child: Text.rich(
                          TextSpan(
                              text: "${context.locale.expiration_date}: ",
                              style: getSemiBoldStyle(
                                  color: ColorManager.thirdBlack,
                                  fontSize: FontSize.s14),
                              children: [
                                TextSpan(
                                  text: widget.endDate,
                                  style: getSemiBoldStyle(
                                      color: ColorManager.mainRed,
                                      fontSize: FontSize.s14),
                                ),
                              ]),
                        ),
                      )
                    ],
                  ],
                ),
              ),
            ),
            if (widget.hasAction && widget.actionText != null) ...[
              16.verticalSpace,
              CustomButton(
                  frontText: widget.actionText!,
                  prefixIcon: widget.actionIcon,
                  onPressed: () => widget.action?.call())
            ]
          ],
        ),
      ),
    );
  }
}

class SearchableProductSheetContent extends StatefulWidget {
  const SearchableProductSheetContent({
    super.key,
    required this.title,
    required this.products,
  });

  final String title;
  final List<Product> products;

  @override
  State<SearchableProductSheetContent> createState() =>
      _SearchableProductSheetContentState();
}

class _SearchableProductSheetContentState
    extends State<SearchableProductSheetContent> {
  String query = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        padding: Paddings.all16,
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    context.locale.detailed,
                    style: getSemiBoldStyle(
                        color: ColorManager.mainBlue, fontSize: FontSize.s18),
                  ),
                  Bounce(
                    duration: DurationConstant.ms100,
                    onPressed: () => Go.back(),
                    child: Icon(
                      Icons.close,
                      color: ColorManager.mainBlack,
                      size: 20.sp,
                    ),
                  )
                ],
              ),
              16.verticalSpace,
              TextFormField(
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
                    borderRadius:
                        BorderRadius.all(RadiusManager.radiusCircular6),
                  ),
                ),
              ),
              16.verticalSpace,
              Container(
                constraints: BoxConstraints(
                  maxHeight: 500.h,
                ),
                padding: Paddings.all8,
                decoration: BoxDecoration(
                    color: ColorManager.mainWhite,
                    borderRadius:
                        BorderRadius.all(RadiusManager.radiusCircular6)),
                child: Container(
                  // height: 64.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: ColorManager.mainWhite,
                      borderRadius:
                          BorderRadius.all(RadiusManager.radiusCircular6)),
                  child: Padding(
                    padding: Paddings.all10,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text.rich(
                            TextSpan(
                                text: "${context.locale.at_branch} ",
                                children: [
                                  TextSpan(
                                    text: widget.title,
                                    style: getSemiBoldStyle(
                                        color: ColorManager.mainBlue,
                                        fontSize: 14),
                                  ),
                                  TextSpan(
                                      text: " ${context.locale.detailsss}:")
                                ]),
                            style: getSemiBoldStyle(
                                color: ColorManager.mainBlack, fontSize: 14),
                          ),
                          16.verticalSpace,
                          ...(query.isNotEmpty
                                  ? widget.products.where((element) => element
                                      .title
                                      .toLowerCase()
                                      .contains(query.toLowerCase()))
                                  : widget.products)
                              .map((e) => Text(
                                    '- ${e.title}, ${e.value},  ${e.price} AZN',
                                    style: getRegularStyle(
                                        color: ColorManager.secondaryBlack,
                                        fontSize: FontSize.s14),
                                  ))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              16.verticalSpace,
              CustomButton(
                  frontText: context.locale.it_clear,
                  onPressed: () {
                    query = '';
                    Go.back();
                  })
            ],
          ),
        ),
      ),
    );
  }
}

enum MediaType {
  networkImage,
  networkVideo,
  assetImage,
  assetVideo,
  svgAssetImage
}
