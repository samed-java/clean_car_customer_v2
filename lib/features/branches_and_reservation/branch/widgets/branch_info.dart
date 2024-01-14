import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:clean_car_customer_v2/features/home/data/model/res/branchs_res_model.dart';
import 'package:clean_car_customer_v2/utils/extensions/locale_extension/locale_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BranchInfoWidget extends StatelessWidget {
  const BranchInfoWidget({super.key, this.model});

  final Washing? model;

  @override
  Widget build(BuildContext context) {
    // print(model!.startHour);
    return Container(
      // height: 100.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorManager.mainWhite,
        borderRadius: BorderRadius.all(RadiusManager.radiusCircular6),
      ),
      child: Padding(
        padding: Paddings.horizontal10,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 6, bottom: 4, left: 6, right: 6),
                  child: SvgPicture.asset(IconAssets.phone),
                ),
                Padding(
                  padding: Paddings.vertical4,
                  child: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: '${context.locale.phonenumber} : ',
                          style: getSemiBoldStyle(
                              color: ColorManager.mainBlack, fontSize: 14),
                        ),
                        if (model!.phone != null)
                          TextSpan(
                            text: model!.phone.toString(),
                            style: getMediumStyle(
                                color: ColorManager.mainBlack, fontSize: 14),
                          ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 6, bottom: 4, left: 6, right: 6),
                  child: SvgPicture.asset(IconAssets.clock),
                ),
                Padding(
                  padding: Paddings.vertical4,
                  child: RichText(
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: '${context.locale.workinghours} :',
                          style: getSemiBoldStyle(
                              color: ColorManager.mainBlack, fontSize: 14),
                        ),
                        TextSpan(
                          text: ' ${model!.startHour}-${model!.endHour}',
                          style: getMediumStyle(
                              color: ColorManager.mainBlack, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 6, bottom: 4, left: 6, right: 6),
                  child: SvgPicture.asset(IconAssets.location),
                ),
                Expanded(
                  child: Padding(
                    padding: Paddings.vertical4,
                    child: RichText(
                      overflow: TextOverflow.fade,
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: '${context.locale.address} : ',
                            style: getSemiBoldStyle(
                                color: ColorManager.mainBlack, fontSize: 14),
                          ),
                          TextSpan(
                            text: model!.address,
                            style: getMediumStyle(
                                color: ColorManager.mainBlack, fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
