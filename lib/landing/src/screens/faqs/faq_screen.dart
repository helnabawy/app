part of 'faq.imports.dart';

class FAQScreen extends StatefulWidget {
  const FAQScreen();

  @override
  State<FAQScreen> createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  final _faqData = FrequentQuestionData(frequentQuestionsRepo: FrequentQuestionsRepo());

  @override
  void initState() {
    super.initState();
    _faqData.init(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: FrequentQuestionData.faqCubit),
        BlocProvider.value(value: FrequentQuestionData.faqCategoryCubit),
      ],
      child: Scaffold(
        appBar: SearchAppBar(
          title: 'faq',
          onBack: () => AutoRouter.of(context).pop(),
          onSearch: () => _faqData.showSearchFieldCubit.onUpdateData(true),
          onClose: () => _faqData.closeSearch(context: context),
          onTextInputChange: (String val) {
            _faqData.searchInQuestions(value: val, context: context);
          },
          searchCubit: _faqData.showSearchFieldCubit,
          searchController: _faqData.search,
        ),
        body: Column(
          children: [
            General.sizeBoxVertical(20.0),
            EventTrackingBaseWidget(
              child: FAQCategoryWidget(frequentQuestionData: _faqData),
              appCenterEvent: AppCenterEventEnum.LandingFaqCats,
            ),
            General.sizeBoxVertical(30.0),
            Expanded(
              child: EventTrackingBaseWidget(
                  appCenterEvent: AppCenterEventEnum.LandingFAQ,
                  child: FrequentQuestionAnswersWidget(faqData: _faqData)),
            )
          ],
        ),
      ),
    );
  }
}
