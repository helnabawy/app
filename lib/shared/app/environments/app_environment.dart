import 'package:qcb/landing/src/shared/api_endpoints.enum.dart';
import 'package:qcb/shared/app/environments/environment.enum.dart';
import 'package:qcb/shared/infrastructure/tracking/app_center/app_center_secrets.dart';
import 'package:qcb/shared/app/environments/environment.prod.dart' as prod;
import 'package:qcb/shared/app/environments/environment.test.dart' as test;

class AppEnvironment {
  static final AppEnvironment _shared = AppEnvironment._();
  AppEnvironment._();
  factory AppEnvironment() => _shared;

  TargetEnvironment _targetEnvironment = TargetEnvironment.testing;

  ApiVersion _version = ApiVersion.V1;

  setEnvironment({required TargetEnvironment target, required ApiVersion version}) {
    _targetEnvironment = target;
    _version = version;
  }

  static get serverUrl {
    return isTesting ? test.Environment.serverUrl : prod.Environment.serverUrl;
  }

  TargetEnvironment get targetEnvironment => _targetEnvironment;

  static bool get isTesting => AppEnvironment().targetEnvironment == TargetEnvironment.testing;

  String get version => _version.name;

  static ApiEndpoints get configurationEndPoint {
    return isTesting ? ApiEndpoints.configurationsTest : ApiEndpoints.configurations;
  }

  static ApiEndpoints get menuEndPoint {
    return isTesting ? ApiEndpoints.menusTest : ApiEndpoints.menus;
  }

  static ApiEndpoints get microAppEndPoint {
    return isTesting ? ApiEndpoints.microAppsTest : ApiEndpoints.microApps;
  }

  static String get executionUrl {
    return isTesting ? test.Environment.executionEndPoint : prod.Environment.executionEndPoint;
  }

  static AppCenterSecrets getAppCenterSecrets() {
    return AppCenterSecrets(
        androidSecret: isTesting ? test.Environment.appCenterAndroid : prod.Environment.appCenterAndroid,
        iosSecret: isTesting ? test.Environment.appCenterIos : prod.Environment.appCenterIos);
  }
}
