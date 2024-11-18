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

import '../services/navigation_service/navigation_service.dart';

class Sheets {
  Sheets._();

  static void showExtraDetailSheet(
      {required String title,
      required String content,
      String? endDate,
      void Function()? action,
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
              content: content,
              actionText: actionText,
              actionIcon: actionIcon,
              mediaType: mediaType,
              mediaSource: mediaSource,
              action: action);
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
  });

  final String title;
  final String content;
  final String? endDate;
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
      setState(() {

      });
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
              decoration: BoxDecoration(
                  color: ColorManager.mainWhite,
                  borderRadius:
                      BorderRadius.all(RadiusManager.radiusCircular6)),
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
                      borderRadius: BorderRadius.all(RadiusManager.radiusCircular6,),
                      child: Container(
                        width: 1.sw,
                        height: 200.h, decoration: BoxDecoration(
                              color: ColorManager.mainBackgroundColor,
                              borderRadius:
                              BorderRadius.all(RadiusManager.radiusCircular6)),
                        child: Builder(
                          builder: (_) {
                            return switch (widget.mediaType) {
                              const (MediaType.networkImage) =>
                                CachedNetworkImage(
                                  imageUrl: widget.mediaSource!,
                                ),
                              const (MediaType.networkVideo) => Stack(
                                  children: [
                                    controller!.value.isInitialized
                                        ? CachedVideoPlayerPlus(controller!)
                                        : SizedBox.shrink(),
                                    Positioned(
                                      bottom: 8,
                                      right: 8,
                                      child: Bounce(
                                        onPressed: () async {
                                          await controller!.setVolume(isMuted?1:0);
                                          setState(() {
                                            isMuted = !isMuted;
                                          });
                                        },
                                        duration: DurationConstant.ms100,
                                        child: Icon(isMuted
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
                                    : Center(child: CupertinoActivityIndicator(),),
                              (_) => SizedBox.shrink(),
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
                            text: "Bitme muddeti: ",
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
            if (widget.actionText != null) ...[
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

enum MediaType {
  networkImage,
  networkVideo,
  assetImage,
  assetVideo,
  svgAssetImage
}
