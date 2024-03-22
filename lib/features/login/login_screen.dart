import 'package:clean_car_customer_v2/components/custom_upper_part.dart';
import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:clean_car_customer_v2/features/login/widgets/login_lower_part.dart';
import 'package:clean_car_customer_v2/utils/extensions/locale_extension/locale_extension.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Gaps.h24,
              CustomUpperPart(
                headerText: context.locale.welcome,
                subText: context.locale.loginfirsttext,
              ),
              Gaps.h24,
              LoginLowerPart(),
            ],
          ),
        ),
      ),
    );
  }
}
