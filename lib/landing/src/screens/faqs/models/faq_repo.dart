part of 'models.imports.dart';

class FrequentQuestionsRepo {
  Future<List<FAQCategory>> getFAQCats() async {
    try {
      final response = await Network().httpClient.callApi<List>(
            endpoint: ApiEndpoints.faqCategories.value,
            headers: ApiEndpoints.faqCategories.headers,
            returnType: ReturnType.List,
            appCenterEvent: AppCenterEventEnum.LoadingFaqCats,
            toJsonFunc: (json) => FAQCategory.fromJson(json),
            methodType: MethodType.Get,
          );
      return response.map((category) => category as FAQCategory).toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<FAQModel>> getFrequentQuestions() async {
    try {
      final response = await Network().httpClient.callApi<List>(
            endpoint: ApiEndpoints.faqQuestions.value,
            headers: ApiEndpoints.faqQuestions.headers,
            returnType: ReturnType.List,
            refresh: false,
            appCenterEvent: AppCenterEventEnum.LoadingFAQ,
            returnDataFun: (data) => data,
            toJsonFunc: (json) => FAQModel.fromJson(json),
            methodType: MethodType.Get,
          );
      return response.map((faq) => faq as FAQModel).toList();
    } catch (e) {
      rethrow;
    }
  }
}
