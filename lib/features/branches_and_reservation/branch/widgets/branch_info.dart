import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BranchInfoWidget extends StatelessWidget {
  const BranchInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
                          text: 'Telefon nömrəsi :',
                          style: getSemiBoldStyle(
                              color: ColorManager.mainBlack, fontSize: 14),
                        ),
                        TextSpan(
                          text: ' 0557306040',
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
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'İş saatları :',
                          style: getSemiBoldStyle(
                              color: ColorManager.mainBlack, fontSize: 14),
                        ),
                        TextSpan(
                          text: ' 09:00 - 20:00',
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
                Padding(
                  padding: Paddings.vertical4,
                  child: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Ünvan :',
                          style: getSemiBoldStyle(
                              color: ColorManager.mainBlack, fontSize: 14),
                        ),
                        TextSpan(
                          text: ' Haji Jafarli st. 123',
                          style: getMediumStyle(
                              color: ColorManager.mainBlack, fontSize: 14),
                        ),
                      ],
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
