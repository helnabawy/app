part of 'terms_and_conditions.imports.dart';

class UsageTermsData {
  static final cubit = PrivacyAndTermsCubit();
  final HomeRepo homeRepo;

  UsageTermsData({required this.homeRepo});

  init({required BuildContext context}) async {
    await getPrivacyPolicyAndUsageTerms(context: context, refresh: false);
    await getPrivacyPolicyAndUsageTerms(context: context, refresh: true);
  }

  getPrivacyPolicyAndUsageTerms({required BuildContext context, bool refresh = true}) async {
    try {
      PrivacyAndTermsModel privacyAndTermsModel = await homeRepo.getPrivacyPolicyAndUsageTerms(refresh: refresh);
      cubit.onUpdateState(privacyAndTermsModel);
    } on PlatformException catch (e) {
      cubit.onErrorState(e.details);
    }
  }
}
