import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:clean_car_customer_v2/data/services/local/storage_service.dart';
import 'package:clean_car_customer_v2/locator.dart';
import 'package:clean_car_customer_v2/utils/extensions/locale_extension/locale_extension.dart';
import 'package:clean_car_customer_v2/utils/services/firebase/firebase_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/pager/go.dart';
import '../../../../utils/pager/pager.dart';

class ProfileExitContainer extends StatelessWidget {
  const ProfileExitContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorManager.mainWhite,
        borderRadius: BorderRadius.all(
          Radius.circular(6.r),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(6.r),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () async {
              await FirebaseService.firebaseMessaging.unsubscribeFromTopic(
                  "customer${locator.get<StorageService>().getPhoneNumber()!}");
              var oldLangCode = locator.get<StorageService>().getLangCode();
              await locator.get<StorageService>().instance.erase();
              await locator.get<StorageService>().setLangCode(oldLangCode);
              Go.removeUntillAndGo(Pager.splashBegin);
            },
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.only(
                    top: 16.h, bottom: 16.h, left: 16.w, right: 12.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      context.locale.exit,
                      style: getMediumStyle(
                          color: ColorManager.mainBlack, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
