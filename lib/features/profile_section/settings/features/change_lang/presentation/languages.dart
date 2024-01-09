import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:clean_car_customer_v2/features/profile_section/profile/widgets/profile_container_content.dart';
import 'package:clean_car_customer_v2/features/profile_section/settings/features/change_lang/cubit/languages_cubit.dart';
import 'package:clean_car_customer_v2/features/profile_section/settings/widgets/settings_container_content.dart';
import 'package:clean_car_customer_v2/utils/extensions/locale_extension/locale_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LanguagesScreen extends StatelessWidget {
  const LanguagesScreen({super.key});

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
              child: Text(
                context.locale.languages,
                style: getSemiBoldStyle(
                  color: ColorManager.mainWhite,
                  fontSize: 20,
                ),
              ),
            ),
            Expanded(
              child: Container(
                // height: MediaQuery.of(context).size.height * (712 / 816),
                decoration: BoxDecoration(
                  color: ColorManager.mainBackgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.r),
                    topRight: Radius.circular(16.r),
                  ),
                ),
                child: Padding(
                  padding: Paddings.all16,
                  child: BlocBuilder<LanguagesCubit,LanguagesState>(
                    builder: (context,state){
                      if(state is LanguagesSuccess){
                        return StreamBuilder(
                          stream: context.read<LanguagesCubit>().selectedLanguage,
                            builder: (context,value){
                            return ListView.separated(
                              separatorBuilder: (_,__)=>16.verticalSpace,
                              itemBuilder: (context,index){
                              return GestureDetector(
                                onTap: () async {
                                    context.read<LanguagesCubit>().changeLanguage(state.data.languages.elementAt(index).code);
                                },
                                child: Container(
                                  width: 1.sw,
                                  height: 72.h,
                                  padding: Paddings.all16,
                                  decoration: BoxDecoration(
                                    color: value.data == state.data.languages.elementAt(index).code ? ColorManager.mainBlue : ColorManager.mainWhite,
                                    borderRadius: BorderRadius.circular(6.r),
                                  ),
                                  child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                                    CachedNetworkImage(
                                      imageUrl:state.data.languages.elementAt(index).icon,
                                      height: 28.h,
                                      width: 28.w,
                                      // colorFilter: ColorFilter.mode(
                                      //     isSelected ? ColorManager.mainWhite : ColorManager.mainBlue,
                                      //     BlendMode.srcIn),
                                    ),
                                    16.horizontalSpace,
                                    Text(
                                      state.data.languages.elementAt(index).title,
                                      style: getMediumStyle(
                                        color:
                                        value.data == state.data.languages.elementAt(index).code ? ColorManager.mainWhite : ColorManager.mainBlack,
                                        fontSize: 14,
                                      ),
                                    ),

                                  ]),
                                ),
                              );
                            },
                            itemCount: state.data.languages.length,
                            );
                            }

                        );
                      }else if(state is LanguagesLoading){
                        return const Center(child: CupertinoActivityIndicator(),);
                      }else if(state is LanguagesFail){
                        return const Center(child: Text("Unknown error occured"),);
                      }else{
                        return const SizedBox.shrink();
                      }
                    },
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
