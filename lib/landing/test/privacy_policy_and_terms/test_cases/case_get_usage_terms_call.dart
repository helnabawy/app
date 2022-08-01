import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qcb/landing/src/screens/terms_and_conditions/blocs/privacy_and_terms_cubit.dart';
import 'package:qcb/landing/src/screens/terms_and_conditions/terms_and_conditions.imports.dart';

import '../privacy_policy_repo_mock.dart';

void getUsageTermsCallTest(UsageTermsData _usageTermsData) {
  //using [testWidgets] because it provides context object vice [test]
  testWidgets('case default response', (WidgetTester tester) async {
    await tester.pumpWidget(
      //cubit provider
      BlocProvider<PrivacyAndTermsCubit>(
          create: (_) => PrivacyAndTermsCubit(),
          //bloc listener to listen to the states and its changes
          child: BlocListener<PrivacyAndTermsCubit, PrivacyAndTermsState>(
            listener: (context, state) {
              //case check for [get usage terms call] resolve
              if (state is PrivacyAndTermUpdateState) {
                //  base/expected result
                var baseResult = MockHomeRepo.mockedPrivacyAndTermsModel.termsAndConditions;
                //
                var actualResult = state.privacyAndTermsModel?.termsAndConditions;
                // compare expected vs actual
                expect(actualResult, baseResult);
              }
            },
            child: BlocBuilder<PrivacyAndTermsCubit, PrivacyAndTermsState>(
              builder: (BuildContext context, state) {
                //trigger [get usage terms] call
                _usageTermsData.getPrivacyPolicyAndUsageTerms(context: context);
                // The builder function must return a widget.
                return const Placeholder();
              },
            ),
          )),
    );
  });
}
