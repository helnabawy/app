import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qcb/landing/src/screens/partners/blocs/partners_cubit.dart';
import 'package:qcb/landing/src/screens/partners/partners.imports.dart';

import '../partners_repo_mock.dart';

void closeSearchAfterSearchForPartnerTest(PartnerData _partnersData) {
  //using [testWidgets] because it provides context object vice [test]
  testWidgets('case close search after search for [ت]', (WidgetTester tester) async {
    bool changes = true;
    await tester.pumpWidget(
      //cubit provider
      BlocProvider<PartnersCubit>(
          create: (_) => PartnersCubit(),
          //bloc listener to listen to the states and its changes
          child: BlocListener<PartnersCubit, PartnersState>(
            listener: (context, state) {
              if (state is PartnersUpdateState) {
                if (state.changed == changes && changes == true) {
                  //case [get partners call] succeeded
                  //calling search action to changes the list
                  _partnersData.searchCallBack(context: context, key: 'ت');
                  changes = false;
                } else if (state.changed == changes && changes == false) {
                  //case [search action] succeeded
                  //calling close search action to changes the list again to its default
                  _partnersData.closeSearch(context: context);
                } else {
                  //case listen to close action action result
                  //  base/expected result
                  var baseResult = MockPartnerRepo.partnersFullList;
                  // compare expected vs actual
                  expect(state.partners, baseResult);
                }
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
