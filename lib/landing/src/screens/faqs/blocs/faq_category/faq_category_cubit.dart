import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:qcb/landing/src/screens/faqs/models/faq_cat_entity.dart';
import 'package:qcb/landing/src/screens/faqs/models/faq_category.dart';

part 'faq_category_state.dart';

class FAQCategoryCubit extends Cubit<FAQCategoryState> {
  FAQCategoryCubit() : super(FAQCategoryInitial());

  onUpdateState(FAQCatEntity? faqEntity) {
    emit(FAQCategoryUpdateState(
      faqEntity: faqEntity,
      changed: !state.changed,
    ));
  }

  selectCategory({required FAQCategory category}) {
    state.faqEntity.catId = category.id;
    emit(FAQCategoryUpdateState(faqEntity: state.faqEntity, changed: !state.changed));
  }
}
