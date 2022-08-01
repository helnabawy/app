import 'package:flutter_test/flutter_test.dart';
import 'package:qcb/landing/src/screens/faqs/faq.imports.dart';

import 'faq_repo_mock.dart';
import 'test_cases/case_close_search.dart';
import 'test_cases/case_get_frequent_questions_categories_list.dart';
import 'test_cases/case_get_frequent_questions_list.dart';
import 'test_cases/case_get_frequent_questions_list_first_page.dart';
import 'test_cases/case_get_frequent_questions_list_pagination.dart';
import 'test_cases/case_search.dart';
import 'test_cases/case_select_category.dart';

void main() {
  FrequentQuestionData frequentQuestionData = FrequentQuestionData(frequentQuestionsRepo: MockFrequentQuestionsRepo());
  group('faq testing', () {
    getFaqCallTest(frequentQuestionData);
    getFaqFirstPageCallTest(frequentQuestionData);
    getFaqPaginationTest(frequentQuestionData);
    faqSearchTest(frequentQuestionData);
    faqCloseSearchTest(frequentQuestionData);

    selectCategoryTest(frequentQuestionData);
    getFaqCategoriesCallTest(frequentQuestionData);
  });
}
