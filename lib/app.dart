import 'package:clean_car_customer_v2/utils/extensions/locale_extension/locale_extension.dart';
import 'package:clean_car_customer_v2/utils/services/navigation_service/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'constants/res/theme.dart';
import 'utils/enum/locale_enum.dart';
import 'utils/pager/pager.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          locale: Locale(LocaleType.EN.name),
          supportedLocales: context.supportedLocales,
          localizationsDelegates: context.localizationsDelegate,
          debugShowCheckedModeBanner: false,
          navigatorKey: NavigationService.instance.navigationKey,
          theme: getApplicationTheme(),
          home: Pager.splahBegin,
        );
      },
    );
  }
}
