import 'package:qcb/landing/src/screens/home/models/models.imports.dart';
import 'package:qcb/landing/src/shared/models/privacy_and_terms_model.dart';
import 'package:qcb/shared/infrastructure/network/network.imports.dart';
import 'package:qcb/shared/utilities/utils.imports.dart';

//class to mock HomeRepo by implements it
class MockHomeRepo implements HomeRepo {
  MockHomeRepo() {
    updateMockedList();
  }

  void updateMockedList() async {
    mockedPrivacyAndTermsModel = await JsonParser<PrivacyAndTermsModel>().loadJsonData(
        filePath: 'lib/landing/test/privacy_policy_and_terms/responses/privacy_policy_and_usage_terms.json',
        returnType: ReturnType.Model,
        fromJsonFunc: (data) => PrivacyAndTermsModel.fromJson(data)) as PrivacyAndTermsModel;
  }

  //get get Privacy Policy And UsageTerms mock response

  @override
  Future<PrivacyAndTermsModel> getPrivacyPolicyAndUsageTerms({bool refresh = true}) async {
    return mockedPrivacyAndTermsModel;
  }

  static PrivacyAndTermsModel mockedPrivacyAndTermsModel =
      PrivacyAndTermsModel(termsAndConditions: '', privacyPolicy: '');
}
