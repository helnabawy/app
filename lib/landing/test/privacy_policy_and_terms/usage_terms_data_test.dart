import 'package:flutter_test/flutter_test.dart';
import 'package:qcb/landing/src/screens/terms_and_conditions/terms_and_conditions.imports.dart';

import 'privacy_policy_repo_mock.dart';
import 'test_cases/case_get_usage_terms_call.dart';

void main() {
  UsageTermsData _usageTermsData = UsageTermsData(homeRepo: MockHomeRepo());
  group('usage and terms tests', () {
    getUsageTermsCallTest(_usageTermsData);
  });
}
