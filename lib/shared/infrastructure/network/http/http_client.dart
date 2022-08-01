part of 'http.imports.dart';

class HttpClient implements HttpClientHandler {
  late String _baseUrl;

  @override
  String get baseUrl => _baseUrl;

  @override
  Future<T> callApi<T>(
      {required ReturnType returnType,
      required MethodType methodType,
      required String endpoint,
      AppCenterEventEnumBase? appCenterEvent,
      Function(dynamic data)? returnDataFun,
      Map<String, dynamic>? json,
      ResponseType responseType = ResponseType.json,
      Map<String, String>? headers,
      bool? showLoader = false,
      Function(dynamic data)? toJsonFunc,
      bool refresh = true}) {
    throw UnimplementedError();
  }

  @override
  setBaseUrl(String url) {
    _baseUrl = url;
  }

  @override
  BuildContext get context => throw UnimplementedError();

  @override
  setContext(BuildContext context) {
    throw UnimplementedError();
  }
}
