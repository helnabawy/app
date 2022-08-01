part of 'faq_widgets.imports.dart';

class FAQCategoryWidget extends StatelessWidget {
  final FrequentQuestionData frequentQuestionData;

  FAQCategoryWidget({required this.frequentQuestionData});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FAQCategoryCubit, FAQCategoryState>(
      builder: (context, state) {
        if (state is FAQCategoryInitial) {
          return Container();
        } else if (state is FAQCategoryUpdateState) {
          return Container(
            height: 40.0,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.faqEntity.faqCats.length,
                itemExtent: 90.0,
                itemBuilder: (BuildContext context, int index) {
                  final category = state.faqEntity.faqCats[index];
                  return InkWell(
                    onTap: () {
                      frequentQuestionData.selectCategory(context: context, category: category);
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.withOpacity(0.5)),
                          color: category.id == state.faqEntity.catId ? AppColors.babyBlue : Colors.transparent),
                      child: Center(
                        child: AppText(
                          title: category.name,
                          color: category.id == state.faqEntity.catId ? AppColors.white : AppColors.grey,
                          size: 14.0,
                          align: TextAlign.center,
                        ),
                      ),
                    ),
                  );
                }),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
