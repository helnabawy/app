import 'package:qcb/landing/src/shared/api_endpoints.enum.dart';
import 'package:qcb/shared/infrastructure/network/network.imports.dart';
import 'package:qcb/shared/infrastructure/push_notification/push_notification_handler.dart';
import 'package:qcb/shared/infrastructure/tracking/app_center/app_center_event.dart';
import 'package:qcb/shared/services/device_info/device_info_service.dart';

class LoginRepo {
  static Future<dynamic> saveUserSessions({bool refresh = true}) async {
    try {
      final response = await Network().httpClient.callApi<dynamic>(
          endpoint: ApiEndpoints.saveUserSessions.value,
          headers: ApiEndpoints.saveUserSessions.headers,
          json: {
            'loginStatus': true,
            'deviceId': await DeviceInfoService.getDeviceUUID(),
            'deviceToken': await PushNotificationHandler.getDeviceToken()
          },
          returnType: ReturnType.Type,
          appCenterEvent: AppCenterEventEnum.SaveUserSessions,
          showLoader: false,
          refresh: refresh,
          toJsonFunc: (data) => data,
          returnDataFun: (data) => data,
          methodType: MethodType.Post);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // This
  static Future getUserInfo({bool refresh = true}) async {
    try {
      final response = await Network().httpClient.callApi(
          endpoint: ApiEndpoints.getUserInfo.value,
          headers: ApiEndpoints.getUserInfo.headers,
          returnType: ReturnType.Type,
          appCenterEvent: AppCenterEventEnum.SaveUserSessions,
          showLoader: false,
          refresh: refresh,
          toJsonFunc: (data) => data,
          returnDataFun: (data) => data,
          methodType: MethodType.Get);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
