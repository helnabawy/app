import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qcb/landing/src/screens/faqs/blocs/faq/faq_cubit.dart';
import 'package:qcb/landing/src/screens/faqs/faq.imports.dart';

import '../faq_repo_mock.dart';

void getFaqCallTest(FrequentQuestionData frequentQuestionData) {
  //using [testWidgets] because it provides context object vice [test]
  testWidgets('case get FAQ', (WidgetTester tester) async {
    await tester.pumpWidget(BlocProvider<FAQCubit>(
      create: (_) => FAQCubit(),
      child: BlocListener<FAQCubit, FAQState>(
        listener: (context, state) {
          //case check for [get faq call] resolve
          // [state.changed == true] to make sure it's the full list
          if (state is FAQUpdateState && state.changed == true) {
            //  base/expected result
            var baseResult = MockFrequentQuestionsRepo.frequentQuestionsFullList;
            // compare expected vs actual
            expect(state.faqEntity.faqs, baseResult);
          }
        },
        child: BlocBuilder<FAQCubit, FAQState>(
          builder: (BuildContext context, state) {
            //trigger [get faq] call
            frequentQuestionData.getFAQ(context: context);
            // The builder function must return a widget.
            return const Placeholder();
          },
        ),
      ),
    )
        //cubit provider

        );
  });
}
