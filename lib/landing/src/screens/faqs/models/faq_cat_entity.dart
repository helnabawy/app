import 'package:qcb/landing/src/screens/faqs/models/faq_category.dart';

class FAQCatEntity {
  List<FAQCategory> faqCats;
  String catId;
  FAQCatEntity({this.catId = '', required this.faqCats});
}
