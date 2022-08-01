import 'package:flutter/widgets.dart';
import 'package:qcb/shared/infrastructure/tracking/app_center/app_center_event_enum_base.dart';
import 'package:qcb/shared/infrastructure/tracking/app_center/app_center_track_event.dart';

class ExceptionLogger {
  static void logException({
    required BuildContext context,
    required AppCenterEventEnumBase appCenterEvent,
    String? exception,
  }) {
    AppCenterTrackEvent.trackEventApi(
        appCenterEvent: appCenterEvent, exception: exception, statusCode: '500', context: context);
  }
}
