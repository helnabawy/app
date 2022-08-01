import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qcb/landing/src/screens/partners/blocs/partners_cubit.dart';
import 'package:qcb/landing/src/screens/partners/partners.imports.dart';

import '../partners_repo_mock.dart';

void searchForPartnerTest(PartnerData _partnersData) {
  //using [testWidgets] because it provides context object vice [test]
  testWidgets('case search for [ت]', (WidgetTester tester) async {
    await tester.pumpWidget(
      //cubit provider
      BlocProvider<PartnersCubit>(
          create: (_) => PartnersCubit(),
          //bloc listener to listen to the states and its changes
          child: BlocListener<PartnersCubit, PartnersState>(
            listener: (context, state) {
              if (state is PartnersUpdateState && !state.changed) {
                //case listen to search action result
                //  base/expected result
                var baseResult = MockPartnerRepo.partnersSearchForTList;
                // compare expected vs actual
                expect(state.partners, baseResult);
              } else {
                //case [get partners call] succeeded
                //calling search action
                _partnersData.searchCallBack(context: context, key: 'ت');
              }
            },
            child: BlocBuilder<PartnersCubit, PartnersState>(
              builder: (BuildContext context, state) {
                //trigger [get partners] call to insure getting list to search in
                _partnersData.getPartners(context: context);

                // The builder function must return a widget.
                return const Placeholder();
              },
            ),
          )),
    );
  });
}
