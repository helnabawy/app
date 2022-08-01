part of '../home.imports.dart';

typedef LoginCallback = void Function(BuildContext context);

class HomeActionButtons extends StatelessWidget {
  const HomeActionButtons({Key? key, required this.loginCallback}) : super(key: key);
  final LoginCallback loginCallback;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20.0),
          child: IconButton(
            splashRadius: 28,
            tooltip: translate('chat'),
            onPressed: () {
              AutoRouter.of(context).push(LiveChatScreenRoute(appCenterEventEnum: AppCenterEventEnum.LandingChat));
            },
            icon: SvgPicture.asset('assets/images/livechat_active.svg', width: 40),
          ),
        ),
        FeatureHolder.consumer(
          feature: FeaturesEnum.biometric,
          child: AppButton.biometric(onPressed: () => OAuthService.biometricLogin(context: context)),
        ),
        InkWell(
          onTap: () => loginCallback(context),
          child: Ink(
            decoration: const BoxDecoration(color: AppColors.primary),
            child: Container(
              constraints: const BoxConstraints(maxHeight: 60),
              padding: const EdgeInsetsDirectional.only(top: 16, bottom: 16, end: 16, start: 30),
              width: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText.white(translate('login')),
                  const Icon(Icons.arrow_forward, color: Colors.white),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
