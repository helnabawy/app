import 'package:flutter/material.dart';
import 'package:qcb/shared/infrastructure/tracking/app_center/app_center_event_enum_base.dart';
import 'package:qcb/shared/infrastructure/tracking/app_center/app_center_track_event.dart';

class EventTrackingBaseWidget extends StatefulWidget {
  final Widget child;
  final AppCenterEventEnumBase appCenterEvent;
  final String? microApp;

  const EventTrackingBaseWidget({
    required this.child,
    this.microApp,
    required this.appCenterEvent,
  });

  @override
  State<EventTrackingBaseWidget> createState() => _EventTrackingBaseWidgetState();
}

class _EventTrackingBaseWidgetState extends State<EventTrackingBaseWidget> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100), () {
      AppCenterTrackEvent.trackEvent(
          appCenterEvent: widget.appCenterEvent, context: context, microApp: widget.microApp);
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
