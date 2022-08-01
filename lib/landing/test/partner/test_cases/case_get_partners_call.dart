import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qcb/landing/src/screens/partners/blocs/partners_cubit.dart';
import 'package:qcb/landing/src/screens/partners/partners.imports.dart';

import '../partners_repo_mock.dart';

void getPartnersCallTest(PartnerData _partnersData) {
  //using [testWidgets] because it provides context object vice [test]
  testWidgets('case of 6 partners', (WidgetTester tester) async {
    await tester.pumpWidget(
      //cubit provider
      BlocProvider<PartnersCubit>(
          create: (_) => PartnersCubit(),
          //bloc listener to listen to the states and its changes
          child: BlocListener<PartnersCubit, PartnersState>(
            listener: (context, state) {
              //case check for [get partner call] resolve
              if (state is PartnersUpdateState) {
                //  base/expected result
                var baseResult = MockPartnerRepo.partnersFullList;
                // compare expected vs actual
                expect(state.partners, baseResult);
              }
            },
            child: BlocBuilder<PartnersCubit, PartnersState>(
              builder: (BuildContext context, state) {
                //trigger [get partners] call
                _partnersData.getPartners(context: context);
                // The builder function must return a widget.
                return const Placeholder();
              },
            ),
          )),
    );
  });
}
