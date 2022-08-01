import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:qcb/shared/infrastructure/network/network.imports.dart';
import 'package:qcb/shared/infrastructure/tracking/app_center/app_center_event_enum_base.dart';

abstract class HttpClientHandler {
  final BuildContext context;
  final String baseUrl;

  setBaseUrl(String url);

  setContext(BuildContext context);

  Future<T> callApi<T>(
      {required ReturnType returnType,
      required MethodType methodType,
      required String endpoint,
      AppCenterEventEnumBase? appCenterEvent,
      Function(dynamic data)? returnDataFun,
      Map<String, dynamic>? json,
      Map<String, String>? headers,
      ResponseType responseType,
      bool? showLoader = false,
      Function(dynamic data)? toJsonFunc,
      bool refresh = true});

  HttpClientHandler(this.baseUrl, this.context);
}
