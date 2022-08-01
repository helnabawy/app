import 'package:qcb/shared/app/environments/app_environment.dart';
import 'package:qcb/shared/app/environments/environment.enum.dart';
import 'package:qcb/shared/infrastructure/network/headers_types.dart';
import 'package:qcb/shared/infrastructure/network/network.imports.dart';
import 'package:qcb/shared/services/device_info/device_info_service.dart';

final _version = AppEnvironment().version;

final _osType =
    OsTypeEnum.values.firstWhere(((element) => element.name.toLowerCase() == DeviceInfoService.getOS())).value;

enum ApiEndpoints {
  configurations,
  microApps,
  menus,
  configurationsTest,
  microAppsTest,
  menusTest,
  partners,
  faqCategories,
  faqQuestions,
  policies,
  saveUserSessions,
  getUserInfo
}

extension ApiEndpointsExtender on ApiEndpoints {
  String get value {
    switch (this) {
      case ApiEndpoints.configurations:
        return '/Mobile/Configuration$_version.json';
      case ApiEndpoints.microApps:
        return '/Mobile/Apps$_version.json';
      case ApiEndpoints.menus:
        return '/Mobile/menus$_version.json';

      case ApiEndpoints.configurationsTest:
        return '${AuthenticationType.service}/api/mobile-releases/$_osType/${DeviceInfoService.version}/app-configs';
      case ApiEndpoints.microAppsTest:
        return '${AuthenticationType.service}/api/mobile-releases/$_osType/${DeviceInfoService.version}/micro-apps';
      case ApiEndpoints.menusTest:
        return '${AuthenticationType.service}/api/mobile-releases/$_osType/${DeviceInfoService.version}/menu-items';

      case ApiEndpoints.partners:
        return '${AuthenticationType.portal}/applications/landing/api/partners?ignoreLogosPayload=true';
      case ApiEndpoints.faqCategories:
        return '${AuthenticationType.portal}/applications/landing/api/FaqCategory/Get';
      case ApiEndpoints.faqQuestions:
        return '${AuthenticationType.portal}/applications/landing/api/FaqQuestion/GetQuestions';
      case ApiEndpoints.policies:
        return '/policies.json';
      case ApiEndpoints.saveUserSessions:
        return '${AuthenticationType.service}/api/user-sessions';
      case ApiEndpoints.getUserInfo:
        return '${AuthenticationType.portal}/api/userInfo';
      default:
        return '/' + name;
    }
  }

  Map<String, String> get headers {
    switch (this) {
      case ApiEndpoints.partners:
      case ApiEndpoints.faqCategories:
      case ApiEndpoints.faqQuestions:
      case ApiEndpoints.policies:
        return PortalHeaders.headers;

      case ApiEndpoints.saveUserSessions:
        return ServiceMobileHeaders.headers;

      default:
        return EmptyHeaders.headers;
    }
  }
}
