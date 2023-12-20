import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:clean_car_customer_v2/features/branches_and_reservation/reservation/widgets/choose_car_dialog.dart';
import 'package:clean_car_customer_v2/features/profile_section/my_cars/widgets/car_info_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReservationChooseCar extends StatelessWidget {
  const ReservationChooseCar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 44.h,
            child: TextFormField(
              onTap: () {
                chooseCarDialog(context);
              },
              readOnly: true,
              cursorColor: ColorManager.thirdBlack,
              onChanged: (value) {},
              decoration: InputDecoration(
                suffixIcon: Image.asset(IconAssets.arrowDown),
                contentPadding: Paddings.all8,
                filled: true,
                fillColor: ColorManager.mainWhite,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(RadiusManager.radiusCircular6),
                ),
              ),
            ),
          ),
        ),
        Gaps.w16,
        Bounce(
          onPressed: () {
            carInfoDialog(context, isNew: true);
          },
          duration: const Duration(milliseconds: 80),
          child: Container(
            width: 44.w,
            height: 44.h,
            // width: double.infinity,
            decoration: BoxDecoration(
              color: ColorManager.mainWhite,
              borderRadius: BorderRadius.circular(6.r),
            ),
            child: Padding(
              padding: Paddings.all12,
              child: SvgPicture.asset(
                IconAssets.plus,
                colorFilter:
                    ColorFilter.mode(ColorManager.mainBlue, BlendMode.srcIn),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
