import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:clean_car_customer_v2/utils/sheets/sheets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/res/asset_manager.dart';
import '../../../constants/res/color_manager.dart';
import '../../../constants/res/font_manager.dart';
import '../../../constants/res/paddings.dart';
import '../../../constants/res/radius_manager.dart';
import '../../../constants/res/styles_manager.dart';

class NotificationTile extends StatelessWidget {
  const NotificationTile({
    super.key,
    required this.isReaden,
  });

  final bool isReaden;

  @override
  Widget build(BuildContext context) {
    return Bounce(
      duration: DurationConstant.ms100,
      onPressed: () {
        Sheets.showExtraDetailSheet(
            title: "Nöbəti ödənişsiz Detallı yuma...",
            content:
                """Payız mövsümündə, avtomobil baxımı üçün "Continental Avtoservis"i seçən hər bir sürücümüz:
        - "Clean Car"dan ödənişsiz Detallı Yuma xidməti əldə edəcək.
        - "Clean Car" ilə servis daxilində göstərilən bütün xidmətlərdən 15%-dək endirimlə yararlana biləcək.
        Unutmayın, avtomobiliniz evinizdən sonra ən böyük sərmayənizdir!""",
            endDate: "00.00.0000",
            actionText: "Vebsayta muraciet edin",
            actionIcon: SvgPicture.asset(IconAssets.web,width: 16,height: 16,));
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
                      "iueiojgiuhgciuehrymwo8chyotwhx8og3hr4cxqwhe",
                      overflow: TextOverflow.ellipsis,
                      style: getMediumStyle(
                          color: isReaden
                              ? ColorManager.mainBlack
                              : ColorManager.fourthBlack,
                          fontSize: FontSize.s14),
                    ),
                  ),
                  8.verticalSpace,
                  SizedBox(
                    width: 1.sw,
                    child: Text(
                      "iueiojgiuhgciuehrymwo8chyotwhx8og3hr4cxqwhe trhewrtbverv ye ryj ertjhvertbyvtrhde",
                      style: getRegularStyle(
                          color: ColorManager.fourthBlack,
                          fontSize: FontSize.s14),
                    ),
                  ),
                  8.verticalSpace,
                  SizedBox(
                    height: 20.h,
                    width: 1.sw,
                    child: Text(
                      "7 saat evvel",
                      overflow: TextOverflow.ellipsis,
                      style: getRegularStyle(
                          color: ColorManager.fourthBlack,
                          fontSize: FontSize.s14),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
