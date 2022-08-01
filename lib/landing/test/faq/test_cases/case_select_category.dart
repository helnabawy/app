import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qcb/landing/src/screens/faqs/blocs/faq/faq_cubit.dart';
import 'package:qcb/landing/src/screens/faqs/faq.imports.dart';
import 'package:qcb/landing/src/screens/faqs/models/faq_category.dart';
import 'package:qcb/landing/src/screens/faqs/models/faq_model.dart';
import 'package:qcb/shared/infrastructure/blocs/lang_cubit/lang_cubit.dart';
import 'package:tf_validator/localization/SetLocalization.dart';

import '../faq_repo_mock.dart';

void selectCategoryTest(FrequentQuestionData frequentQuestionData) {
  int change = 0;
  //using [testWidgets] because it provides context object vice [test]
  testWidgets('case paginated page of FAQ', (WidgetTester tester) async {
    await tester.pumpWidget(MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => LangCubit()),
        BlocProvider(create: (BuildContext context) => FAQCubit()),
      ],
      child: BlocBuilder<LangCubit, LangState>(
        builder: (context, state) {
          return MaterialApp(
              supportedLocales: const [
                Locale('ar', 'SA'),
                Locale('en', 'US'),
              ],
              localizationsDelegates: [
                SetLocalization.localizationsDelegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              locale: state.locale,
              builder: (ctx, child) {
                return BlocListener<FAQCubit, FAQState>(
                  listener: (context, state) {
                    //case check for [get faq call] resolve

                    if (state is FAQUpdateState && change == 1) {
                      //add more page
                      frequentQuestionData.selectCategory(
                          context: context, category: MockFrequentQuestionsRepo.frequentQuestionsCategoriesFullList[1]);
                    } else if (state is FAQUpdateState && state.changed == true && change > 1) {
                      FAQCategory selectedCategory = MockFrequentQuestionsRepo.frequentQuestionsCategoriesFullList[1];
                      //  base/expected result
                      //due to pagination the result should be the first 19
                      List<FAQModel> baseResult = MockFrequentQuestionsRepo.frequentQuestionsFullList
                          .where((element) => element.categoryId.contains(selectedCategory.id))
                          .toList();
                      // compare expected vs actual
                      expect(state.faqEntity.faqs, baseResult);
                    }
                    change++;
                  },
                  child: BlocBuilder<FAQCubit, FAQState>(
                    builder: (BuildContext context, state) {
                      //trigger [get faq] call
                      if (change == 0) {
                        frequentQuestionData.init(context: context);
                      }

                      return const Placeholder();
                    },
                  ),
                );
              });
        },
      ),
    )
        //cubit provider
        );
    await tester.pumpAndSettle();

    //cubit provider
  });
}
