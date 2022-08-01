part of 'faq.imports.dart';

class FrequentQuestionData {
  static final FAQCategoryCubit faqCategoryCubit = FAQCategoryCubit();
  static final FAQCubit faqCubit = FAQCubit();
  final GenericCubit<bool> showSearchFieldCubit = GenericCubit(false);
  final TextEditingController search = TextEditingController();
  final FrequentQuestionsRepo frequentQuestionsRepo;
  int pageSize = 10;
  int currentPage = 1;
  RefreshController refreshController = RefreshController(initialRefresh: false);

  FrequentQuestionData({required this.frequentQuestionsRepo});

  init({required BuildContext context}) async {
    await getFAQCategories(context: context);
    await getFAQ(context: context);
    if (faqCategoryCubit.state.faqEntity.faqCats.isNotEmpty) {
      faqCategoryCubit.selectCategory(category: faqCategoryCubit.state.faqEntity.faqCats.first);
    }
  }

  getFAQCategories({required BuildContext context}) async {
    try {
      final categories = await frequentQuestionsRepo.getFAQCats();

      faqCategoryCubit.state.faqEntity.faqCats = categories;
      faqCategoryCubit.state.faqEntity.faqCats.insert(
          0,
          FAQCategory(
            name: translate('all'),
            isSelected: true,
            id: 'all',
            numberOfQuestions: 0,
          ));
      faqCategoryCubit.onUpdateState(faqCategoryCubit.state.faqEntity);
    } catch (e) {
      rethrow;
    }
  }

  getFAQ({required BuildContext context}) async {
    try {
      final faqs = await frequentQuestionsRepo.getFrequentQuestions();
      faqCubit.state.faqEntity.faqs = faqs;
      faqCubit.onInitialUpdateState(faqCubit.state.faqEntity);
      faqCubit.paginate(pageNumber: 1, pageSize: 10, list: faqs);
    } on PlatformException catch (e) {
      faqCubit.onErrorState(e.details);
    }
  }

  closeSearch({required BuildContext context}) {
    showSearchFieldCubit.onUpdateData(false);
    search.text = '';
    faqCubit.searchInQuestions(value: '');
  }

  searchInQuestions({required BuildContext context, required String value}) {
    faqCubit.searchInQuestions(value: value);
  }

  selectCategory({required BuildContext context, required FAQCategory category}) {
    faqCategoryCubit.selectCategory(category: category);
    faqCubit.filterQuestions(category: category);
  }

  onLoading({required BuildContext context}) {
    currentPage++;
    var catId = faqCategoryCubit.state.faqEntity.catId;
    if (catId == 'all') {
      faqCubit.paginate(
        pageNumber: currentPage,
        list: faqCubit.state.originalFaqs,
      );
    }
    refreshController.loadComplete();
  }

  onRefresh() {
    refreshController.refreshCompleted();
  }
}
