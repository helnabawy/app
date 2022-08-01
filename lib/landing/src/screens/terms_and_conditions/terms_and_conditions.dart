part of 'terms_and_conditions.imports.dart';

class TermsAndConditionsScreen extends StatefulWidget {
  const TermsAndConditionsScreen();

  @override
  State<TermsAndConditionsScreen> createState() => _TermsAndConditionsScreenState();
}

class _TermsAndConditionsScreenState extends State<TermsAndConditionsScreen> {
  UsageTermsData usageTermsData = UsageTermsData(homeRepo: HomeRepo());

  @override
  void initState() {
    super.initState();
    usageTermsData.init(context: context);
  }

  @override
  void dispose() {
    if (mounted) {
      UsageTermsData.cubit.close();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: UsageTermsData.cubit,
      child: EventTrackingBaseWidget(
        appCenterEvent: AppCenterEventEnum.LandingTermsAndConditions,
        child: Scaffold(
          appBar: DefaultAppBar(title: translate('terms_conditions')),
          body: BlocBuilder<PrivacyAndTermsCubit, PrivacyAndTermsState>(
            builder: (context, state) {
              if (state is PrivacyAndTermUpdateState) {
                return SingleChildScrollView(
                  padding: const EdgeInsets.all(10.0),
                  child: Html(
                    data: state.privacyAndTermsModel!.termsAndConditions,
                  ),
                );
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
