import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:clean_car_customer_v2/features/profile_section/profile/widgets/profile_container_arrow.dart';
import 'package:clean_car_customer_v2/features/profile_section/profile/widgets/profile_container_switch.dart';
import 'package:clean_car_customer_v2/features/profile_section/profile/widgets/profile_exit_container.dart';
import 'package:clean_car_customer_v2/utils/extensions/locale_extension/locale_extension.dart';
import 'package:clean_car_customer_v2/utils/pager/go.dart';
import 'package:clean_car_customer_v2/utils/pager/pager.dart';

import 'package:flutter/material.dart';

class SettingsContainerContent extends StatefulWidget {
  const SettingsContainerContent({super.key});

  @override
  State<SettingsContainerContent> createState() =>
      _SettingsContainerContentState();
}

class _SettingsContainerContentState extends State<SettingsContainerContent> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Gaps.h8,
          ProfileContainerArrow(
            onPressed: () {
              Go.to(Pager.contacts);
            },
            headerText: context.locale.contactus,
          ),
          Gaps.h16,
          ProfileContainerArrow(
            onPressed: () {
              Go.to(Pager.languages);
            },
            headerText: context.locale.languages,
          ),
        ],
      ),
    );
  }
}
