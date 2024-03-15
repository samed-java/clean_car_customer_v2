import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:clean_car_customer_v2/features/profile_section/settings/features/faq/cubit/faq_cubit.dart';
import 'package:clean_car_customer_v2/features/profile_section/settings/features/faq/presentation/widgets/faq_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FAQContent extends StatelessWidget {
  const FAQContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FaqCubit, FaqState>(
      builder: (context, state) {
        if (state is FaqLoading) {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        } else if (state is FaqSuccess) {
          return Padding(
            padding: const EdgeInsets.only(top: 16),
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: FAQItem(
                    question: state.data.faqs[index].title,
                    answer: state.data.faqs[index].content,
                  ),
                );
              },
              itemCount: state.data.faqs.length,
            ),
          );
        } else if (state is FaqFail) {
          return Center(
            child: Text(state.message ?? ''),
          );
        } else {
          return Gaps.empty;
        }
      },
    );
  }
}
