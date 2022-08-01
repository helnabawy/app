import 'package:flutter_test/flutter_test.dart';
import 'package:qcb/landing/src/screens/privacy_policy/privacy_policy.imports.dart';

import 'privacy_policy_repo_mock.dart';
import 'test_cases/case_get_privacy_policy_call.dart';

void main() {
  PrivacyPolicyData _privacyPolicyData = PrivacyPolicyData(homeRepo: MockHomeRepo());
  group('Privacy and policy tests', () {
    getPrivacyPolicyCallTest(_privacyPolicyData);
  });
}
