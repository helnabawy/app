part of 'privacy_policy.imports.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen();

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  PrivacyPolicyData privacyPolicyData = PrivacyPolicyData(homeRepo: HomeRepo());

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    if (mounted) {
      PrivacyPolicyData.cubit.close();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    privacyPolicyData.init(context: context);

    return BlocProvider.value(
      value: PrivacyPolicyData.cubit,
      child: EventTrackingBaseWidget(
        appCenterEvent: AppCenterEventEnum.LandingPrivacyPolicy,
        child: Scaffold(
          appBar: DefaultAppBar(title: translate('privacy_policy')),
          body: BlocBuilder<PrivacyAndTermsCubit, PrivacyAndTermsState>(
            builder: (context, state) {
              if (state is PrivacyAndTermUpdateState) {
                if (state.privacyAndTermsModel != null) {
                  return SingleChildScrollView(
                    padding: const EdgeInsets.all(10.0),
                    child: Html(
                      data: state.privacyAndTermsModel!.privacyPolicy,
                    ),
                  );
                } else {
                  return Center(
                    child: AppText.normal(translate('no_result')),
                  );
                }
              } else if (state is PrivacyAndTermsErrorState) {
                return Center(
                  child: AppText.normal(translate(state.responseError!.message)),
                );
              } else {
                return LoadingDialog.showLoadingView();
              }
            },
          ),
        ),
      ),
    );
  }
}
