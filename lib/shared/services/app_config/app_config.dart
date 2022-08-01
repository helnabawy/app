import 'dart:io';

import 'package:qcb/shared/app/environments/app_environment.dart';
import 'package:qcb/shared/enums/features.enum.dart';
import 'package:qcb/shared/models/app_config/app_config.dart';
import 'package:qcb/shared/models/app_config/micro_app_options.dart';

class AppConfigService {
  AppConfigService._();
  static final AppConfigService _instance = AppConfigService._();
  factory AppConfigService() => _instance;

  static AppConfig? _appConfig;

  init(AppConfig? appConfig) {
    _appConfig ??= appConfig;
  }

  static MicroAppsOptions getMicroAppsConfigs() {
    return _appConfig!.microAppsOptions;
  }

  static String getproxyUrl() {
    return _appConfig == null ? AppEnvironment.serverUrl : _appConfig!.proxyOptions.baseUrl;
  }

  static String getChatWidgetUrl() {
    return getproxyUrl() + _appConfig!.applicationOptions.chatUrl;
  }

  static String getSSOUrl() {
    return _appConfig!.sSOOptions.baseUrl;
  }

  static bool isAppInReview() {
    return _appConfig!.applicationOptions.inReview;
  }

  static String getOSVersion() {
    return Platform.isIOS
        ? _appConfig!.applicationOptions.appVersion.iOS
        : _appConfig!.applicationOptions.appVersion.android;
  }

  static String getClientId() {
    return _appConfig!.sSOOptions.clientId;
  }

  static String getClientSecret() {
    return _appConfig!.sSOOptions.secret;
  }

  static bool isFeaturesEnable(FeaturesEnum featuresEnum) {
    var feature = _appConfig!.applicationOptions.features!.toJson().entries.firstWhere(
          (element) => element.key.toLowerCase() == featuresEnum.name.toLowerCase(),
          orElse: () => const MapEntry('', false),
        );
    return feature.value;
  }
}
