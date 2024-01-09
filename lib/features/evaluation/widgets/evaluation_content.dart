import 'package:clean_car_customer_v2/components/custom_button.dart';
import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:clean_car_customer_v2/features/evaluation/widgets/comment_section.dart';
import 'package:clean_car_customer_v2/features/evaluation/widgets/evaluation_info_card.dart';
import 'package:clean_car_customer_v2/features/evaluation/widgets/star_card.dart';
import 'package:clean_car_customer_v2/utils/extensions/locale_extension/locale_extension.dart';
import 'package:clean_car_customer_v2/utils/pager/pager.dart';
import 'package:clean_car_customer_v2/utils/pager/transition.dart';
import 'package:flutter/material.dart';

class EvaluationContent extends StatelessWidget {
  const EvaluationContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const EvaluationInfoCard(),
          Gaps.h24,
          StarCardWidget(
            onRatingChanged: (int rating) {
              // print("selected rating $rating");
            },
          ),
          Gaps.h24,
          const CommentTextField(),
          Gaps.h24,
          CustomButton(
            frontText: context.locale.confirm,
            onPressed: () {
              PageTransitionUtils.navigateWithFadeInTransition(
                context,
                Pager.splash(
                    svgAssets: ImageAssets.confirmed,
                    headerText: "${context.locale.sent}!!!",
                    subText: context.locale.ritefirsttext,
                    page: Pager.main),
              );
            },
          ),
        ],
      ),
    );
  }
}
