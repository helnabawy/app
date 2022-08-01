part of 'faq_widgets.imports.dart';

class FrequentQuestionAnswersWidget extends StatelessWidget {
  final FrequentQuestionData faqData;
  const FrequentQuestionAnswersWidget({required this.faqData});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FAQCubit, FAQState>(
      builder: (context, state) {
        if (state is FAQInitial) {
          return LoadingDialog.showLoadingView();
        } else if (state is FAQUpdateState) {
          if (state.faqEntity.faqs.isNotEmpty) {
            return SmartRefresher(
              controller: faqData.refreshController,
              enablePullDown: true,
              header: const WaterDropHeader(),
              enablePullUp: true,
              onRefresh: () => faqData.onRefresh(),
              onLoading: () => faqData.onLoading(context: context),
              child: ListView.builder(
                  itemCount: state.faqEntity.faqs.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    final question = state.faqEntity.faqs[index];
                    return Container(
                      child: ExpansionTile(
                        collapsedIconColor: AppColors.babyBlue,
                        onExpansionChanged: (bool change) {
                          FrequentQuestionData.faqCubit.selectFaq(question: question, isChange: change);
                        },
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText.normal(question.question)
                              ..color = question.id == state.faqEntity.faqId && state.faqEntity.isAccordionOpen
                                  ? AppColors.babyBlue
                                  : Theme.of(context).colorScheme.onSurface.withAlpha(95),
                            Divider(color: Colors.grey.withOpacity(0.7))
                          ],
                        ),
                        children: <Widget>[
                          ListTile(
                              title: Html(
                            data: question.answer,
                          ))
                        ],
                      ),
                    );
                  }),
            );
          } else {
            return Center(
              child: AppText.normal(translate('no_result')),
            );
          }
        } else if (state is FAQErrorState) {
          return Center(
            child: AppText.normal(translate(state.responseError!.message)),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
