part of 'logout.imports.dart';

class LogoutData {
  LogoutRepo repo;
  GenericCubit<String?> authUrlCubit = GenericCubit<String?>(null);

  LogoutData({required this.repo});

  getOAuthUrl() {
    authUrlCubit.onUpdateData('logout url');
  }

  onLoadStop(BuildContext context, Uri? uri) {
    UserService.resetLoggedInUser(context: context);
    authUrlCubit.onUpdateToInitState(null);
    AppStorage.preferences.remove(PreferencesKeys.accessToken.name);
    AppStorage.preferences.remove(PreferencesKeys.refreshToken.name);
    AutoRouter.of(context).replace(const HomeScreenRoute());
  }
}
