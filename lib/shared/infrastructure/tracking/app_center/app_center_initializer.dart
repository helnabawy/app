import 'package:app_center_bundle_sdk/app_center_bundle_sdk.dart';
import 'package:qcb/shared/app/environments/app_environment.dart';

abstract class AppCenterInitializer {
  static init() async {
    final appCenterSecrets = AppEnvironment.getAppCenterSecrets();

    await AppCenter.startAsync(
      appSecretAndroid: appCenterSecrets.androidSecret,
      appSecretIOS: appCenterSecrets.iosSecret,
      enableAnalytics: true,
      enableCrashes: true,
      enableDistribute: true,
      usePrivateDistributeTrack: false,
      disableAutomaticCheckForUpdate: false,
    );
  }
}
