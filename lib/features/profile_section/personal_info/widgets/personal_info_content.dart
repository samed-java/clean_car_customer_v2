import 'package:clean_car_customer_v2/constants/res/gaps.dart';
import 'package:clean_car_customer_v2/features/profile_section/personal_info/widgets/personal_info_card.dart';
import 'package:flutter/material.dart';

class PersonalInfoContent extends StatelessWidget {
  const PersonalInfoContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Gaps.h8,
          const PersonalInfoCard(
            headerText: "Tam ad",
            subText: "Hacı Cəfərli",
          ),
          Gaps.h16,
          const PersonalInfoCard(
            headerText: "Email",
            subText: "jafarlihaji@gmail.com",
          ),
          Gaps.h16,
          const PersonalInfoCard(
            headerText: "Telefon nömrəsi",
            subText: "055 - 555 -55 -55",
          ),
          Gaps.h16,
        ],
      ),
    );
  }
}
