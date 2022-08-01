import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qcb/landing/src/screens/privacy_policy/privacy_policy.imports.dart';
import 'package:qcb/landing/src/screens/terms_and_conditions/blocs/privacy_and_terms_cubit.dart';

import '../privacy_policy_repo_mock.dart';

void getPrivacyPolicyCallTest(PrivacyPolicyData _privacyPolicyData) {
  //using [testWidgets] because it provides context object vice [test]
  testWidgets('case default response', (WidgetTester tester) async {
    await tester.pumpWidget(
      //cubit provider
      BlocProvider<PrivacyAndTermsCubit>(
          create: (_) => PrivacyAndTermsCubit(),
          //bloc listener to listen to the states and its changes
          child: BlocListener<PrivacyAndTermsCubit, PrivacyAndTermsState>(
            listener: (context, state) {
              //case check for [get privacy policy call] resolve
              if (state is PrivacyAndTermUpdateState) {
                //  base/expected result
                var baseResult = MockHomeRepo.mockedPrivacyAndTermsModel.privacyPolicy;
                // actual result
                var actualResult = state.privacyAndTermsModel?.privacyPolicy;
                // compare expected vs actual
                expect(actualResult, baseResult);
              }
            },
            child: BlocBuilder<PrivacyAndTermsCubit, PrivacyAndTermsState>(
              builder: (BuildContext context, state) {
                //trigger [get privacy policy] call
                _privacyPolicyData.getPrivacyPolicyAndUsageTerms(context: context);
                // The builder function must return a widget.
                return const Placeholder();
              },
            ),
          )),
    );
  });
}
