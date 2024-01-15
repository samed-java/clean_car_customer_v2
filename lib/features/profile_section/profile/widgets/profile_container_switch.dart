import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:clean_car_customer_v2/data/services/local/storage_service.dart';
import 'package:clean_car_customer_v2/locator.dart';
import 'package:clean_car_customer_v2/utils/extensions/locale_extension/locale_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileContainerSwitch extends StatefulWidget {
  const ProfileContainerSwitch({
    super.key,
  });

  @override
  State<ProfileContainerSwitch> createState() => _ProfileContainerSwitchState();
}

class _ProfileContainerSwitchState extends State<ProfileContainerSwitch> {
  late bool _isSwitched;

  @override
  void initState() {
    _isSwitched = locator.get<StorageService>().getNotificationEnabled();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: ColorManager.mainWhite,
          borderRadius: BorderRadius.all(Radius.circular(6.r))),
      child: Padding(
        padding:
            EdgeInsets.only(top: 14.h, bottom: 14.h, left: 16.w, right: 12.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              context.locale.notifications,
              style:
                  getMediumStyle(color: ColorManager.mainBlack, fontSize: 16),
            ),
            SizedBox(
              height: 30.h,
              width: 36.w,
              child: CupertinoSwitch(
                activeColor: ColorManager.mainBlue,
                value: _isSwitched,
                onChanged: (newValue) {
                  setState(() {
                    locator.get<StorageService>().setNotificationEnabled(newValue);
                    _isSwitched = newValue;
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
