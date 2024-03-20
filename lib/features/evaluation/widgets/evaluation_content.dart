import 'package:clean_car_customer_v2/components/custom_button.dart';
import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:clean_car_customer_v2/features/evaluation/cubit/rating_cubit.dart';
import 'package:clean_car_customer_v2/features/evaluation/widgets/comment_section.dart';
import 'package:clean_car_customer_v2/features/evaluation/widgets/evaluation_info_card.dart';
import 'package:clean_car_customer_v2/features/evaluation/widgets/star_card.dart';
import 'package:clean_car_customer_v2/utils/extensions/locale_extension/locale_extension.dart';
import 'package:clean_car_customer_v2/utils/pager/pager.dart';
import 'package:clean_car_customer_v2/utils/pager/transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EvaluationContent extends StatelessWidget {
  const EvaluationContent(
      {super.key, required this.branch, required this.service});

  final String branch;
  final String service;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RatingCubit>();
    return SingleChildScrollView(
      child: Column(
        children: [
          EvaluationInfoCard(service: service, branch: branch,),
          Gaps.h24,
          StarCardWidget(
            onRatingChanged: (int rating) {
              cubit.score = rating;
            },
          ),
          Gaps.h24,
          CommentTextField(controller: cubit.commentController,),
          Gaps.h24,
          BlocListener<RatingCubit, RatingState>(
            listener: (context, state) {
              if(state is RatingSuccess){
                PageTransitionUtils.navigateFadeInTransition(
                  context,
                  Pager.splash(
                      svgAssets: ImageAssets.confirmed,
                      headerText: "${context.locale.sent}!!!",
                      subText: context.locale.ritefirsttext,
                      backCount: 2
                      ),
                );
              }
            },
            child: CustomButton(
              frontText: context.locale.confirm,
              onPressed: () {
                  cubit.rate();
              },
            ),
          ),
        ],
      ),
    );
  }
}
