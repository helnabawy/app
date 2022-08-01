part of 'home.imports.dart';

class HomeData {
  GlobalKey<ScaffoldState> scaffold = GlobalKey<ScaffoldState>();
  init({required BuildContext context}) async {
    await initializeAppServices(context);
    fetchConfigurations(context: context);
    fetchMenu(context: context, refresh: false);
    fetchMenu(context: context, refresh: true);
    fetchIonicApps(context: context);
  }

  checkInternetConnection({required BuildContext context}) async {
    ConnectivityResult result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      Dialogs.showErrorDialog(
        context: context,
        error: translate('check_internet'),
      );
    }
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        Dialogs.showErrorDialog(
          context: context,
          error: translate('check_internet'),
        );
      } else {
        init(context: context);
      }
    });
  }

  onLogin(BuildContext context) async {
    context.push(LoginScreenRoute());
  }

  fetchMenu({required BuildContext context, bool refresh = true}) async {
    var cubit = context.read<MenuCubit>();
    try {
      MenuTypesModel menuTypesModel = await HomeRepo.getMenus(refresh: refresh);
      _addNeItemToVerificationMenu(menuTypesModel);
      cubit.onUpdateState(menuTypesModel);
    } on PlatformException catch (e) {
      cubit.onErrorState(e.details);
    }
  }

  void _addNeItemToVerificationMenu(MenuTypesModel menuTypesModel) {
    if (menuTypesModel.verificationMenu!.isNotEmpty) {
      final allServicesItem = MenuItemModel(
        title: translate('show_all_services'),
        route: 'showAllServices',
        showInHomePage: true,
        icon: 'showAllServices',
      );
      menuTypesModel.verificationMenu!.add(allServicesItem);
    }
  }

  fetchIonicApps({required BuildContext context}) async {
    try {
      final ionicMicroApps = await HomeRepo.getMicroApps();
      AppService().init(ionicMicroApps);
      context.read<MicroAppCubit>().onUpdateState(ionicMicroApps);
    } catch (e) {
      // throw e;
    }
  }

  fetchConfigurations({required BuildContext context}) async {
    try {
      final configurations = await HomeRepo.getConfigurations();
      if (configurations is AppConfig) {
        context.read<ConfigCubit>().onUpdateConfig(configurations);
        AppConfigService().init(configurations);
        Network().httpClient.setBaseUrl(AppConfigService.getproxyUrl());
        _saveConfigurationFlags(configurations);
        _saveConfigurationsInNative();
        _checkAppVersion(context);
      }
    } catch (e) {
      rethrow;
    }
  }

  _saveConfigurationsInNative() async {
    const _configChannel = MethodChannel('com.najiz.main/configurations');
    await _configChannel.invokeMethod('saveConfig', {'config': AppConfigService.getMicroAppsConfigs().toJson()});
  }

  _saveConfigurationFlags(AppConfig config) async {
    await AppStorage.preferences.setString(PreferencesKeys.appConfig.name, config.toJson().toString());
  }

  _checkAppVersion(BuildContext context) async {
    final currentVersion = await DeviceInfoService.getAppVersion(), configVersion = AppConfigService.getOSVersion();
    if (currentVersion != configVersion) {
      Dialogs.showUpdateDialog(context, _openStoreLink, AppConfigService.isAppInReview());
    }
  }

  _openStoreLink() {
    StoreRedirect.redirect(androidAppId: AppConstants.androidId, iOSAppId: AppConstants.iosId);
  }

  initializeAppServices(BuildContext context) async {
    LocalizationService.setContext(context);
    LanguageService.changeLanguage('ar', context);
    await DeviceInfoService.getAppVersion();
    AppConfigService().init(null);
    AppStorage.preferences.remove(PreferencesKeys.accessToken.name);
    Network().init(context: context, httpClient: DioClient());
  }
}
