part of 'network.imports.dart';

enum ReturnType {
  Model,
  List,
  Type,
}

enum MethodType {
  Get,
  Post,
  Put,
  Patch,
  Delete,
}

abstract class AuthenticationType {
  static const noAuthentication = '';
  static const portal = '/portal';
  static const apigee = '/services';
  static const service = '/portalServices';
}
