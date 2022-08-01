import 'package:flutter_test/flutter_test.dart';
import 'package:qcb/landing/src/screens/partners/partners.imports.dart';

import 'partners_repo_mock.dart';
import 'test_cases/case_close_search.dart';
import 'test_cases/case_get_partners_call.dart';
import 'test_cases/case_search.dart';

void main() {
  PartnerData _partnersData = PartnerData(partnerRepo: MockPartnerRepo());
  group('partners tests', () {
    getPartnersCallTest(_partnersData);
    searchForPartnerTest(_partnersData);
    closeSearchAfterSearchForPartnerTest(_partnersData);
  });
}
