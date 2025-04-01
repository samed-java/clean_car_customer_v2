import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:clean_car_customer_v2/features/notification/cubit/notifications_cubit.dart';
import 'package:clean_car_customer_v2/features/notification/data/model/res/notifications_res_model.dart';
import 'package:clean_car_customer_v2/utils/extensions/locale_extension/locale_extension.dart';
import 'package:clean_car_customer_v2/utils/sheets/sheets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class NotificationTile extends StatefulWidget {
  const NotificationTile({
    super.key,
    required this.isRead,
    required this.data,
  });

  final bool isRead;
  final NotificationModel data;

  @override
  State<NotificationTile> createState() => _NotificationTileState();
}

class _NotificationTileState extends State<NotificationTile> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    String description = widget.data.description!;
    bool isLongText = description.length > 100;

    return Bounce(
      duration: DurationConstant.ms100,
      onPressed: () {
        context
            .read<NotificationsCubit>()
            .readNotification(widget.data.id.toString());
        Sheets.showExtraDetailSheet(
          title: widget.data.title!,
          content: widget.data.description!,
        );
      },
      child: Container(
        margin: Paddings.vertical8,
        padding: Paddings.all16,
        decoration: BoxDecoration(
            color: ColorManager.mainWhite,
            borderRadius: BorderRadius.all(RadiusManager.radiusCircular10)),
        width: 1.sw,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                width: 48.sp,
                height: 48.sp,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorManager.mainBackgroundColor,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    ImageAssets.logo,
                    fit: BoxFit.contain,
                    width: 25.sp,
                    height: 25.sp,
                  ),
                )),
            16.horizontalSpace,
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.h,
                    width: 1.sw,
                    child: Text(
                      widget.data.title!,
                      overflow: TextOverflow.ellipsis,
                      style: getMediumStyle(
                          color: !widget.isRead
                              ? ColorManager.mainBlack
                              : ColorManager.fourthBlack,
                          fontSize: FontSize.s14),
                    ),
                  ),
                  8.verticalSpace,
                  SizedBox(
                    width: 1.sw,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: _isExpanded || !isLongText
                                ? description
                                : "${description.substring(0, 60)} ",
                            style: getRegularStyle(
                              color: ColorManager.fourthBlack,
                              fontSize: FontSize.s14,
                            ),
                          ),
                          if (isLongText && !_isExpanded)
                            TextSpan(
                              text: "davamını oxu",
                              style: getUnderlineStyle(
                                color: ColorManager.mainBlue,
                                fontSize: FontSize.s14,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  setState(() {
                                    _isExpanded = true;
                                  });
                                },
                            ),
                        ],
                      ),
                    ),
                  ),
                  if (DateFormat("dd.MM.yyyy").format(DateTime.now()) ==
                      DateFormat("dd.MM.yyyy")
                          .format(widget.data.createdAt!)) ...[
                    8.verticalSpace,
                    SizedBox(
                      height: 20.h,
                      width: 1.sw,
                      child: Text(
                        DateTime.now()
                                    .difference(widget.data.createdAt!)
                                    .inHours >
                                0
                            ? "${DateTime.now().difference(widget.data.createdAt!).inHours} saat evvel"
                            : context.locale.new_new,
                        overflow: TextOverflow.ellipsis,
                        style: getRegularStyle(
                            color: ColorManager.fourthBlack,
                            fontSize: FontSize.s14),
                      ),
                    ),
                  ]
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
