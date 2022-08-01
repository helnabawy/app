part of 'faq_category_cubit.dart';

abstract class FAQCategoryState extends Equatable {
  final FAQCatEntity faqEntity;
  final bool changed;
  FAQCategoryState(this.faqEntity, this.changed);
}

class FAQCategoryInitial extends FAQCategoryState {
  FAQCategoryInitial() : super(FAQCatEntity(faqCats: []), false);

  @override
  List<Object> get props => [faqEntity, changed];
}

class FAQCategoryUpdateState extends FAQCategoryState {
  FAQCategoryUpdateState({FAQCatEntity? faqEntity, bool? changed})
      : super(faqEntity!, changed!);

  @override
  List<Object> get props => [faqEntity, changed];
}
