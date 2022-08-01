import 'package:qcb/shared/infrastructure/tracking/app_center/app_center_event_enum_base.dart';
import 'package:qcb/shared/infrastructure/tracking/app_center/app_center_operation.dart';

enum AppCenterExceptions implements AppCenterEventEnumBase {
  appServicesGetAdditionalDataError('AppServices.getAdditionalData', OperationType.Tracing, '', 'forWhere exception'),
  downloadFileError('downloadFile.checkDocumentFolder', OperationType.Tracing, '', 'open and create temp file error');

  @override
  final String eventName;
  @override
  final OperationType operationType;
  @override
  final String serviceNameEn;
  @override
  final String serviceNameAr;

  const AppCenterExceptions(
    this.eventName,
    this.operationType,
    this.serviceNameEn,
    this.serviceNameAr,
  );
}
