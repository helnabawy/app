import 'app_center_operation.dart';

abstract class AppCenterEventEnumBase {
  final String eventName;
  final OperationType operationType;
  final String serviceNameEn;
  final String serviceNameAr;

  AppCenterEventEnumBase(
      {required this.eventName, required this.operationType, required this.serviceNameEn, required this.serviceNameAr});
}
