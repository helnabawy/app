import 'dart:async' show Future;
import 'package:qcb/landing/src/screens/faqs/models/faq_category.dart';
import 'package:qcb/landing/src/screens/faqs/models/faq_model.dart';
import 'package:qcb/landing/src/screens/faqs/models/models.imports.dart';
import 'package:qcb/shared/infrastructure/network/network.imports.dart';
import 'package:qcb/shared/utilities/utils.imports.dart';

//class to mock FrequentQuestionsRepo by implements it
class MockFrequentQuestionsRepo implements FrequentQuestionsRepo {
  static List<FAQModel> frequentQuestionsFullList = [];
  static List<FAQCategory> frequentQuestionsCategoriesFullList = [];

  MockFrequentQuestionsRepo() {
    updateMockedList();
  }

  void updateMockedList() async {
    frequentQuestionsFullList = await JsonParser<FAQModel>().loadJsonData(
        filePath: 'lib/landing/test/faq/responses/frequent questions.json',
        returnType: ReturnType.List,
        fromJsonFunc: (data) => FAQModel.fromJson(data)) as List<FAQModel>;

    frequentQuestionsCategoriesFullList = await JsonParser<FAQCategory>().loadJsonData(
        filePath: 'lib/landing/test/faq/responses/faq_category.json',
        returnType: ReturnType.List,
        fromJsonFunc: (data) => FAQCategory.fromJson(data)) as List<FAQCategory>;
  }

  @override
  Future<List<FAQCategory>> getFAQCats() async {
    return frequentQuestionsCategoriesFullList;
  }

  @override
  Future<List<FAQModel>> getFrequentQuestions() async {
    return frequentQuestionsFullList;
  }
}
