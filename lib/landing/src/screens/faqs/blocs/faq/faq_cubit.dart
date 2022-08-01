import 'package:qcb/landing/src/screens/faqs/models/faq_entity.dart';
import 'package:qcb/landing/src/screens/faqs/models/faq_model.dart';
import 'package:qcb/shared/models/error_response.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/faq_category.dart';

part 'faq_state.dart';

class FAQCubit extends Cubit<FAQState> {
  FAQCubit() : super(FAQInitial());

  onUpdateState(FAQEntity faqEntity) {
    emit(FAQUpdateState(faqEntity: faqEntity, originalFaqs: state.originalFaqs, changed: !state.changed!));
  }

  onInitialUpdateState(FAQEntity faqEntity) {
    emit(FAQUpdateState(faqEntity: state.faqEntity, originalFaqs: faqEntity.faqs, changed: !state.changed!));
  }

  searchInQuestions({required String value}) {
    List<FAQModel> list =
        state.originalFaqs.where((question) => question.question.toLowerCase().contains(value.toLowerCase())).toList();
    emit(FAQUpdateState(faqEntity: FAQEntity(faqs: list), originalFaqs: state.originalFaqs, changed: !state.changed!));
  }

  filterQuestions({required FAQCategory category}) {
    List<FAQModel> list = state.originalFaqs.where((question) => question.categoryId.first == category.id).toList();
    if (category.id == 'all') {
      list = state.originalFaqs;
    }
    emit(FAQUpdateState(faqEntity: FAQEntity(faqs: list), originalFaqs: state.originalFaqs, changed: !state.changed!));
  }

  selectFaq({required FAQModel question, required bool isChange}) {
    state.faqEntity.faqId = question.id;
    state.faqEntity.isAccordionOpen = isChange;
    emit(FAQUpdateState(faqEntity: state.faqEntity, originalFaqs: state.originalFaqs, changed: !state.changed!));
  }

  onErrorState(ErrorResponse responseError) {
    emit(FAQErrorState(
      responseError: responseError,
      faqEntity: FAQEntity(faqs: [], faqId: ''),
      originalFaqs: [],
      changed: !state.changed!,
    ));
  }

  paginate({
    int pageSize = 10,
    int pageNumber = 1,
    required List<FAQModel> list,
  }) {
    List<FAQModel> totalList = [];
    int start = (pageNumber - 1) * pageSize;
    int end = pageNumber <= 1 ? pageSize - 1 : (pageNumber * pageSize) - 1;
    List<FAQModel> result = list.sublist(start, end);
    totalList.addAll(result);
    emit(FAQUpdateState(
        faqEntity: FAQEntity(faqs: totalList), originalFaqs: state.originalFaqs, changed: !state.changed!));
  }
}
