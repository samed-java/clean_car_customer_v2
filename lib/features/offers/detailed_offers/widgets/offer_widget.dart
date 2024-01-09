import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:clean_car_customer_v2/utils/extensions/locale_extension/locale_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:html_widget/html_widget.dart';

class OfferWidget extends StatelessWidget {
  const OfferWidget({super.key,required this.offerContent});
  final String offerContent;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: ColorManager.mainWhite,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(6.r), topRight: Radius.circular(6.r)),
          ),
          child: Padding(
            padding: EdgeInsets.only(
                top: 10.h, bottom: 2.h, left: 10.w, right: 10.w),
            child: Text(
              "${context.locale.offer} :",
              style:
                  getSemiBoldStyle(color: ColorManager.mainBlack, fontSize: 14),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: ColorManager.mainWhite,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(6.r),
                bottomRight: Radius.circular(6.r)),
          ),
          child: Padding(
            padding: Paddings.all10,
            child: Text(
              offerContent,
              style:
                  getRegularStyle(color: ColorManager.mainBlack, fontSize: 14),
            ),
            // child: Column(
            //   children: MyHtmlParser.parseHtmlToListOfTextWidgets(offerContent),
            // ),
          ),
        ),
      ],
    );
  }
}
