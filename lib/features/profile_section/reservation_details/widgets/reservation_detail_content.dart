import 'package:clean_car_customer_v2/components/custom_button.dart';
import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:clean_car_customer_v2/features/profile_section/reservation_details/widgets/reservation_detail_card.dart';
import 'package:clean_car_customer_v2/utils/pager/pager.dart';
import 'package:clean_car_customer_v2/utils/pager/transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReservationDetailContent extends StatelessWidget {
  const ReservationDetailContent({super.key, required this.isNew});
  final bool isNew;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          ReservationDetailCard(
            headerText: "Ünvan",
            content: Row(
              children: [
                SvgPicture.asset(IconAssets.location),
                Gaps.w4,
                Text(
                  "Nizami filialı, Hadi Rəcəbli küç 123",
                  style: getMediumStyle(
                    color: ColorManager.secondaryBlack,
                    fontSize: 14,
                  ).copyWith(decoration: TextDecoration.underline),
                ),
              ],
            ),
          ),
          Gaps.h16,
          ReservationDetailCard(
            content: Text(
              "KIA Renta, 03-HJ-490 ",
              style: getMediumStyle(
                color: ColorManager.secondaryBlack,
                fontSize: 14,
              ),
            ),
            headerText: "Avtomobil adı və nömrəsi",
          ),
          Gaps.h16,
          ReservationDetailCard(
            content: Text(
              "Kimyəvi təmizləmə",
              style: getMediumStyle(
                color: ColorManager.secondaryBlack,
                fontSize: 14,
              ),
            ),
            headerText: "Xidmət",
          ),
          Gaps.h16,
          ReservationDetailCard(
            content: Text(
              "24 sentyabr, 16:30",
              style: getMediumStyle(
                color: ColorManager.secondaryBlack,
                fontSize: 14,
              ),
            ),
            headerText: "Tarix və saat",
          ),
          Gaps.h16,
          ReservationDetailCard(
            content: Text(
              "Kard",
              style: getMediumStyle(
                color: ColorManager.secondaryBlack,
                fontSize: 14,
              ),
            ),
            headerText: "Ödəniş növü",
          ),
          Gaps.h16,
          ReservationDetailCard(
            content: Text(
              "18 AZN",
              style: getMediumStyle(
                color: ColorManager.secondaryBlack,
                fontSize: 14,
              ),
            ),
            headerText: "Qiymət",
          ),
          Gaps.h16,
          isNew
              ? Gaps.empty
              : CustomButton(
                  frontText: "Sil",
                  onPressed: () {},
                  backgroundColor: ColorManager.mainBackgroundColor,
                  foregroundColor: ColorManager.mainRed,
                  borderColor: ColorManager.mainRed,
                ),
          Gaps.h12,
          isNew
              ? CustomButton(
                  frontText: "Təsdiqlə",
                  onPressed: () {
                    PageTransitionUtils.navigateWithFadeInTransition(
                        context,
                        Pager.splash(
                            svgAssets: ImageAssets.calendar,
                            headerText: "Rezerv edildi!!!",
                            subText:
                                "Rezerv etmə prosesiniz uğurla təsdiqləndi ",
                            page: Pager.main));
                  },
                )
              : CustomButton(
                  frontText: "Dəyişiklik Et",
                  onPressed: () {},
                ),
          Gaps.h16
        ],
      ),
    );
  }
}
