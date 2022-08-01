part of 'login.imports.dart';

class LoginData {
  LoginRepo repo;

  LoginData({required this.repo});

  final oAuthService = OAuthService();
  GenericCubit<String?> authUrlCubit = GenericCubit<String?>(null);
  GenericCubit<bool?> isTopLoaderHiddenCubit = GenericCubit<bool?>(false);

  getOAuthUrl() {
    final ssoUrls = oAuthService.getSSOUrl(), inReview = AppConfigService.isAppInReview();

    authUrlCubit.onUpdateData(oAuthService.getOAuthUrl(ssoUrls, inReview));
    isTopLoaderHiddenCubit.onUpdateData(false);
  }

  getToken(BuildContext context, String code) async {
    try {
      final AuthModel authModel = await oAuthService.getToken(code);
      _getTokenPayload(context, authModel);
    } catch (_) {
      AppCenterTrackEvent.trackEvent(
        context: context,
        appCenterEvent: AppCenterEventEnum.CancelingLoginClicked,
      );
    }
  }

  void _getTokenPayload(BuildContext context, AuthModel authModel) async {
    try {
      var cubit = context.read<UserCubit>();
      Map<String, dynamic> payload = Jwt.parseJwt(authModel.accessToken);
      UserModel userModel = UserModel.fromJson(payload);
      cubit.onUpdateUserData(userModel);

      await AppStorage.preferences.setString(PreferencesKeys.accessToken.name, authModel.accessToken);
      await AppStorage.preferences.setString(PreferencesKeys.refreshToken.name, authModel.refreshToken);

      getUserInfo();
      saveUserSessions();

      AutoRouter.of(context).replace(const TabsRoute());
    } catch (e) {
      AppCenterTrackEvent.trackEvent(
        context: context,
        appCenterEvent: AppCenterEventEnum.ErrorWhileGetUserDataFromJwt,
      );
    }
  }

  handleUpdateWebHistory(BuildContext context, Uri? uri) {
    try {
      final code = uri?.queryParameters['code'];
      if (code != null) {
        authUrlCubit.onUpdateToInitState(null);
        getToken(context, code);
      }
    } catch (e) {
      rethrow;
    }
  }

  hideTopLoader() {
    isTopLoaderHiddenCubit.onUpdateData(true);
  }

  saveUserSessions() async {
    try {
      await LoginRepo.saveUserSessions();
    } catch (e) {
      rethrow;
    }
  }

  getUserInfo() async {
    try {
      await LoginRepo.getUserInfo();
    } catch (e) {
      rethrow;
    }
  }
}
