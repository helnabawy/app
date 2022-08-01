import 'package:flutter/widgets.dart';
import 'package:qcb/shared/enums/app_center_exceptions.dart';
import 'package:qcb/shared/models/ionic_micro_app.dart';
import 'package:qcb/shared/utilities/exception_logger.dart';

class AppService {
  AppService._();

  static final AppService _instance = AppService._();

  factory AppService() => _instance;

  static late List<IonicMicroApp>? _apps;

  init(List<IonicMicroApp>? apps) {
    _apps = apps;
  }

  static String? getAdditionalData({required BuildContext context, required String appName, required String key}) {
    try {
      String apiKey = '';
      apiKey = _apps?.firstWhere((element) => element.name == appName).additionalData?[key];
      return apiKey;
    } catch (e) {
      ExceptionLogger.logException(
          context: context,
          appCenterEvent: AppCenterExceptions.appServicesGetAdditionalDataError,
          exception: e.toString());
    }
    return null;
  }
}
