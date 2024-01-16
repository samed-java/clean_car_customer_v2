import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:clean_car_customer_v2/features/profile_section/settings/features/contacts/cubit/contacts_cubit.dart';
import 'package:clean_car_customer_v2/utils/extensions/locale_extension/locale_extension.dart';
import 'package:clean_car_customer_v2/utils/launcher/launc_mail.dart';
import 'package:clean_car_customer_v2/utils/launcher/launc_url.dart';
import 'package:clean_car_customer_v2/utils/launcher/launch_phone.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../utils/pager/go.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.mainBlue,
      body: SafeArea(
        top: true,
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10.h, bottom: 10.h, left: 20.w),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Go.back();
                    },
                    child: SizedBox(
                      height: 32.h,
                      width: 32.w,
                      child: Padding(
                        padding: Paddings.all8,
                        child: SvgPicture.asset(
                          IconAssets.backButton2,
                          colorFilter: ColorFilter.mode(
                              ColorManager.mainWhite, BlendMode.srcIn),
                        ),
                      ),
                    ),
                  ),
                  Gaps.w4,
                  Text(
                    context.locale.contactus,
                    style: getSemiBoldStyle(
                      color: ColorManager.mainWhite,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: ColorManager.mainBackgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.r),
                    topRight: Radius.circular(16.r),
                  ),
                ),
                child: Padding(
                  padding: Paddings.all16,
                  child: Column(
                    children: [
                      Container(
                        width: 1.sw,
                        padding: Paddings.all16,
                        decoration: BoxDecoration(
                          color: ColorManager.mainWhite,
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                        child: BlocBuilder<ContactsCubit, ContactsState>(
                          builder: (context, state) {
                            if (state is ContactsSuccess) {
                              return Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: state.list
                                      .map(
                                        (e) => Padding(
                                          padding: Paddings.bottom16,
                                          child: GestureDetector(
                                            onTap: () {
                                              if (e.type == "phone") {
                                                call(e.link);
                                              } else if (e.type == "email") {
                                                launchEmail(e.link);
                                              } else {
                                                goSite(e.link);
                                              }
                                            },
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                CachedNetworkImage(
                                                  imageUrl: e.icon,
                                                  width: 20.r,
                                                  height: 20.r,
                                                ),
                                                8.horizontalSpace,
                                                Text(
                                                  "${e.title} :",
                                                  style: getSemiBoldStyle(
                                                      color: ColorManager
                                                          .mainBlack),
                                                ),
                                                8.horizontalSpace,
                                                Text(e.text),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList());
                            } else if (state is ContactsLoading) {
                              return const Center(
                                child: CupertinoActivityIndicator(),
                              );
                            } else if (state is ContactsFail) {
                              return const Center(
                                child: Text("Unknown error occured"),
                              );
                            } else {
                              return const SizedBox.shrink();
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
