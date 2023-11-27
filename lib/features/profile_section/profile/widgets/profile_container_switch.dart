import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
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
  bool _isSwitched = false;
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
              "Notifikasiyalar",
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
