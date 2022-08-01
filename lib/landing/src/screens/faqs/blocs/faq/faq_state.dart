part of 'faq_cubit.dart';

abstract class FAQState extends Equatable {
  final FAQEntity faqEntity;
  final List<FAQModel> originalFaqs;
  final bool? changed;
  final ErrorResponse? responseError;
  FAQState({required this.faqEntity, required this.originalFaqs, this.changed, this.responseError});
}

class FAQInitial extends FAQState {
  FAQInitial()
      : super(faqEntity: FAQEntity(faqs: [], faqId: ''), originalFaqs: [], changed: false, responseError: null);

  @override
  List<Object> get props => [faqEntity, changed!];
}

class FAQUpdateState extends FAQState {
  FAQUpdateState({required FAQEntity faqEntity, required List<FAQModel> originalFaqs, bool? changed})
      : super(faqEntity: faqEntity, originalFaqs: originalFaqs, changed: changed!);

  @override
  List<Object> get props => [faqEntity, changed!];
}

class FAQErrorState extends FAQState {
  FAQErrorState(
      {required FAQEntity faqEntity,
      required List<FAQModel> originalFaqs,
      required ErrorResponse responseError,
      required bool changed})
      : super(faqEntity: faqEntity, originalFaqs: originalFaqs, changed: changed, responseError: responseError);
  @override
  List<Object> get props => [changed!];
}
