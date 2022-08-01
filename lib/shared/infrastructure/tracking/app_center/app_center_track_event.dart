import 'package:app_center_bundle_sdk/app_center_bundle_sdk.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qcb/shared/enums/os.dart';
import 'package:qcb/shared/infrastructure/blocs/user_cubit/user_cubit.dart';
import 'package:qcb/shared/infrastructure/tracking/app_center/app_center_event_enum_base.dart';
import 'package:qcb/shared/models/user.model.dart';
import 'package:qcb/shared/services/device_info/device_info_service.dart';

class AppCenterTrackEvent {
  static trackEvent({
    required AppCenterEventEnumBase appCenterEvent,
    bool isSuccess = true,
    String? microAppNameFromConfig,
    String? microApp,
    required BuildContext context,
  }) async {
    try {
      Map<String, String> params = {
        'serviceNameAr': appCenterEvent.serviceNameAr + ' ${microApp ?? ''}',
        'serviceName': appCenterEvent.serviceNameEn + ' ${microApp ?? ''}',
        'serviceType': appCenterEvent.operationType.type,
        'isSuccessful': '$isSuccess',
        'client_OS': DeviceInfoService.getOS(),
        'client_Type': await _getDeviceModel(),
      };
      params.addAll(_userMapInfo(context));
      AppCenter.trackEventAsync(
        _getEventName(eventName: appCenterEvent.eventName),
        params,
      );
    } catch (e) {
      rethrow;
    }
  }

  static UserModel _getUser(BuildContext context) {
    var cubit = BlocProvider.of<UserCubit>(context);
    UserModel user = cubit.state.model ??
        UserModel(
          age: 'Anonymous',
          birthDateHijri: 'Anonymous',
          dob: 'Anonymous',
          gender: 'Anonymous',
          givenName: 'Anonymous',
          id: 'Anonymous',
          nationalityId: 'Anonymous',
          nationalityName: 'Anonymous',
        );
    return user;
  }

  static Map<String, String> _userMapInfo(BuildContext context) {
    UserModel user = _getUser(context);
    return {
      'userId': user.id,
      'nationality': user.nationalityName,
      'age': user.age,
      'gender': user.gender,
    };
  }

  static trackEventApi(
      {required AppCenterEventEnumBase appCenterEvent,
      required String statusCode,
      String? exception,
      String? microApp,
      String? route,
      required BuildContext context}) async {
    try {
      Map<String, String> params = {
        'exception': exception ?? '',
        'statusCode': statusCode,
        'route': route ?? '',
        'serviceNameAr': appCenterEvent.serviceNameAr + ' ${microApp ?? ''}',
        'serviceName': appCenterEvent.serviceNameEn + ' ${microApp ?? ''}',
        'serviceType': appCenterEvent.operationType.type,
      };
      params.addAll(_userMapInfo(context));
      print(params);
      AppCenter.trackEventAsync(_getEventName(eventName: appCenterEvent.eventName), params);
    } catch (e) {
      rethrow;
    }
  }

  static Future<String> _getDeviceModel() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    String deviceModel = '';
    if (DeviceInfoService.getOS() == OsEnum.Android.value) {
      AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
      deviceModel = androidDeviceInfo.model!;
    } else {
      IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
      deviceModel = iosDeviceInfo.model!;
    }
    return deviceModel;
  }

  static String _getEventName({required String eventName}) {
    String prefix = 'mojCE.mobile.';
    String event = prefix + eventName;
    return event;
  }
}
