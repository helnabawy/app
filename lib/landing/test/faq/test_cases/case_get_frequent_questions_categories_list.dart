import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qcb/landing/src/screens/faqs/blocs/faq_category/faq_category_cubit.dart';
import 'package:qcb/landing/src/screens/faqs/faq.imports.dart';
import 'package:qcb/shared/infrastructure/blocs/lang_cubit/lang_cubit.dart';
import 'package:tf_validator/localization/SetLocalization.dart';

import '../faq_repo_mock.dart';

void getFaqCategoriesCallTest(FrequentQuestionData frequentQuestionData) {
  //using [testWidgets] because it provides context object vice [test]
  testWidgets('case call of FAQ categories', (WidgetTester tester) async {
    await tester.pumpWidget(MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => LangCubit()),
        BlocProvider(create: (BuildContext context) => FAQCategoryCubit()),
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
                return BlocListener<FAQCategoryCubit, FAQCategoryState>(
                  listener: (context, state) {
                    //case check for [get faq call] resolve
                    if (state is FAQCategoryUpdateState) {
                      //  base/expected result
                      var baseResult = MockFrequentQuestionsRepo.frequentQuestionsCategoriesFullList;
                      // compare expected vs actual
                      expect(state.faqEntity.faqCats, baseResult);
                    }
                  },
                  child: Builder(
                    builder: (BuildContext context) {
                      //trigger [get faq Categories] call
                      frequentQuestionData.getFAQCategories(context: context);
                      // The builder function must return a widget.
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
  });
}
