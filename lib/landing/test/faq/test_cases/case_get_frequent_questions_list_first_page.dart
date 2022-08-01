import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qcb/landing/src/screens/faqs/blocs/faq/faq_cubit.dart';
import 'package:qcb/landing/src/screens/faqs/faq.imports.dart';

import '../faq_repo_mock.dart';

void getFaqFirstPageCallTest(FrequentQuestionData frequentQuestionData) {
  //using [testWidgets] because it provides context object vice [test]
  testWidgets('case first page loaded of FAQ', (WidgetTester tester) async {
    await tester.pumpWidget(BlocProvider<FAQCubit>(
      create: (_) => FAQCubit(),
      child: BlocListener<FAQCubit, FAQState>(
        listener: (context, state) {
          //case check for [get faq call] resolve
          // [state.changed == false] to skip the first emit with the full list
          if (state is FAQUpdateState && state.changed == false) {
            //  base/expected result
            //due to pagination the result should be the first 9
            var baseResult = MockFrequentQuestionsRepo.frequentQuestionsFullList.take(9);
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
