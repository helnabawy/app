import 'package:qcb/shared/infrastructure/network/network.imports.dart';

abstract class EndPointHeaders {
  final String authType;

  const EndPointHeaders(this.authType);
}

class EmptyHeaders extends EndPointHeaders {
  const EmptyHeaders() : super(AuthenticationType.noAuthentication);
  static const Map<String, String> headers = const {};
}

class PortalHeaders extends EndPointHeaders {
  const PortalHeaders() : super(AuthenticationType.portal);
  static Map<String, String> headers = {'prefix': 'portal'};
}

class PortalMobileHeaders extends EndPointHeaders {
  const PortalMobileHeaders() : super(AuthenticationType.portal);
  static const Map<String, String> headers = {'X-Najiz-Channel': 'NajizMobile'};
}

class ApigeeHeaders extends EndPointHeaders {
  const ApigeeHeaders() : super(AuthenticationType.apigee);
  static const Map<String, String> headers = {'prefix': 'apigee'};
}

class ApigeeMobileHeaders extends EndPointHeaders {
  ApigeeMobileHeaders() : super(AuthenticationType.apigee);
  static const Map<String, String> headers = {'X-Najiz-Channel': 'NajizMobile'};
}

class ServiceHeaders extends EndPointHeaders {
  ServiceHeaders() : super(AuthenticationType.service);
  static const Map<String, String> headers = {'prefix': 'service'};
}

class ServiceMobileHeaders extends EndPointHeaders {
  ServiceMobileHeaders() : super(AuthenticationType.service);
  static const Map<String, String> headers = {'X-Najiz-Channel': 'NajizMobile'};
}
