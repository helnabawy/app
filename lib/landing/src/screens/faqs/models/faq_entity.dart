import 'package:qcb/landing/src/screens/faqs/models/faq_model.dart';

class FAQEntity {
  List<FAQModel> faqs;
  String faqId;
  bool isAccordionOpen;
  FAQEntity({this.faqId = '', this.isAccordionOpen = false, required this.faqs});
}
