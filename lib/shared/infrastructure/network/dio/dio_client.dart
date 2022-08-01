part of 'dio.imports.dart';

class DioClient implements HttpClientHandler {
  late Dio _dio;
  ResponseType _responseType = ResponseType.json;
  late DioCacheManager _manager;
  Map<String, String>? headers;

  late BuildContext _context;

  @override
  BuildContext get context => _context;

  late String _baseUrl;

  @override
  String get baseUrl => _baseUrl;

  @override
  setBaseUrl(String url) {
    _baseUrl = url;
    init();
  }

  @override
  setContext(BuildContext context) {
    _context = context;
  }

  DioClient();

  init() {
    final dioOptions = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 30 * 1000,
      receiveTimeout: 30 * 1000,
    );
    _dio = Dio(dioOptions)
      ..interceptors.add(_getCacheManager(baseUrl).interceptor)
      ..interceptors.add(LogInterceptor(responseBody: true, requestBody: true, logPrint: (data) {}));
  }

  @override
  Future<T> callApi<T>(
      {required ReturnType returnType,
      required MethodType methodType,
      required String endpoint,
      AppCenterEventEnumBase? appCenterEvent,
      Function(dynamic data)? returnDataFun,
      Map<String, dynamic>? json,
      Map<String, String>? headers,
      bool? showLoader = false,
      Function(dynamic data)? toJsonFunc,
      ResponseType responseType = ResponseType.json,
      bool refresh = true}) {
    _responseType = responseType;
    var dataJson = json ?? {};
    this.headers = headers ?? {};

    switch (methodType) {
      case MethodType.Get:
        return _getData<T>(
            endPoint: endpoint,
            returnType: returnType,
            refresh: refresh,
            headers: headers,
            appCenterEventName: appCenterEvent,
            dataKeyFun: returnDataFun,
            toJsonFunc: toJsonFunc);
      case MethodType.Post:
        return _postData<T>(
            endPoint: endpoint,
            returnType: returnType,
            json: dataJson,
            headers: headers,
            showLoader: showLoader,
            dataKeyFun: returnDataFun,
            toJsonFunc: toJsonFunc);
      case MethodType.Patch:
        return _patchData<T>(
            endPoint: endpoint,
            returnType: returnType,
            json: dataJson,
            showLoader: showLoader,
            dataKeyFun: returnDataFun,
            toJsonFunc: toJsonFunc);
      case MethodType.Put:
        return _putData<T>(
            endPoint: endpoint,
            returnType: returnType,
            json: dataJson,
            showLoader: showLoader,
            dataKeyFun: returnDataFun,
            toJsonFunc: toJsonFunc);
      case MethodType.Delete:
        return _deleteData<T>(
            name: endpoint,
            returnType: returnType,
            json: dataJson,
            showLoader: showLoader,
            dataKeyFun: returnDataFun,
            toJsonFunc: toJsonFunc);
    }
  }

  Future<dynamic> post({required String url, required Map<String, dynamic> body, bool showLoader = true}) async {
    if (showLoader) LoadingDialog.showLoadingDialog();
    _printRequestBody(body);
    FormData formData = FormData.fromMap(body);
    bool haveFile = false;
    body.forEach((key, value) async {
      if ((value) is File) {
        haveFile = true;
        MapEntry<String, MultipartFile> pic = MapEntry(
          key,
          MultipartFile.fromFileSync(value.path, filename: value.path.split('/').last),
        );
        formData.files.add(pic);
      } else if ((value) is List<File>) {
        haveFile = true;
        List<MapEntry<String, MultipartFile>> files = [];
        value.forEach((element) async {
          MapEntry<String, MultipartFile> pic = MapEntry(
              key,
              MultipartFile.fromFileSync(
                element.path,
                filename: element.path.split('/').last,
              ));
          files.add(pic);
        });
        formData.files.addAll(files);
      }
    });

    _dio.options.headers = _getHeader();

    try {
      var response = await _dio.post(url, data: haveFile ? formData : body);
      print('response ${response.statusCode}');
      if (showLoader) LoadingDialog.dismissDialog();
      if ((response.statusCode == 200 || response.statusCode == 201) && response.data != null) {
        return response.data;
      } else {
        showErrorMessage(response);
      }
    } on DioError catch (e) {
      showErrorMessage(e.response);
      if (showLoader) LoadingDialog.dismissDialog();
      rethrow;
    } catch (_) {
      rethrow;
    }

    return null;
  }

  Future<dynamic> put({required String url, required Map<String, dynamic> body, bool showLoader = true}) async {
    if (showLoader) LoadingDialog.showLoadingDialog();

    _printRequestBody(body);
    FormData formData = FormData.fromMap(body);
    bool haveFile = false;
    body.forEach((key, value) async {
      if ((value) is File) {
        haveFile = true;
        //create multipart using filepath, string or bytes
        MapEntry<String, MultipartFile> pic = MapEntry(
          key,
          MultipartFile.fromFileSync(value.path, filename: value.path.split('/').last),
        );
        formData.files.add(pic);
      } else if ((value) is List<File>) {
        haveFile = true;
        List<MapEntry<String, MultipartFile>> files = [];
        value.forEach((element) async {
          MapEntry<String, MultipartFile> pic = MapEntry(
              key,
              MultipartFile.fromFileSync(
                element.path,
                filename: element.path.split('/').last,
              ));
          files.add(pic);
        });
        formData.files.addAll(files);
      }
    });

    _dio.options.headers = _getHeader();

    try {
      var response = await _dio.put(url, data: haveFile ? formData : body);
      print('response ${response.statusCode}');
      if (showLoader) LoadingDialog.dismissDialog();
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        showErrorMessage(response);
      }
    } on DioError catch (_) {
      if (showLoader) LoadingDialog.dismissDialog();
      rethrow;
    } catch (_) {
      rethrow;
    }

    return null;
  }

  Future<dynamic> patch({required String url, required Map<String, dynamic> body, bool showLoader = true}) async {
    if (showLoader) LoadingDialog.showLoadingDialog();
    _printRequestBody(body);
    _dio.options.headers = _getHeader();
    try {
      var response = await _dio.patch(url, data: body);
      print('response ${response.statusCode}');
      if (showLoader) LoadingDialog.dismissDialog();
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        showErrorMessage(response);
      }
    } on DioError catch (_) {
      if (showLoader) LoadingDialog.dismissDialog();
      rethrow;
    } catch (_) {
      rethrow;
    }

    return null;
  }

  Future<dynamic> delete({required String url, required Map<String, dynamic> body, bool showLoader = true}) async {
    if (showLoader) LoadingDialog.showLoadingDialog();
    _printRequestBody(body);
    _dio.options.headers = _getHeader();
    try {
      var response = await _dio.delete(url, data: body);
      print('body response ${response.statusCode}');
      if (showLoader) LoadingDialog.dismissDialog();
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        showErrorMessage(response);
      }
    } on DioError catch (_) {
      if (showLoader) LoadingDialog.dismissDialog();
      rethrow;
    } catch (_) {
      rethrow;
    }

    return null;
  }

  void _printRequestBody(Map<String, dynamic> body) {
    print('-------------------------------------------------------------------');
    log('$body');
    print('-------------------------------------------------------------------');
  }

  Future<dynamic> get({required String url, AppCenterEventEnumBase? appCenterEvent}) async {
    try {
      _dio.options.headers = _getHeader();
      print('url : ${_dio.options.baseUrl + url}');
      var response = await _dio.get(url, options: _buildCacheOptions());
      print('response ${response.statusCode}');
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        showErrorMessage(response);
      }
    } on DioError catch (e) {
      showErrorMessage(e.response);
      rethrow;
    } catch (_) {
      rethrow;
    }
    return null;
  }

  showErrorMessage(Response? response) {
    if (response == null) {
      print('failed response Check Server');

      throw PlatformException(details: ErrorResponse(message: 'result_error'), code: '');
    } else {
      switch (response.statusCode) {
        case 500:
        case 501:
        case 502:
        case 503:
        case 504:
        case 400:
          throw PlatformException(details: response.data, code: '400');
        case 505:
          throw PlatformException(details: ErrorResponse(message: 'result_error'), code: '505');
        case 404:
          throw PlatformException(details: ErrorResponse(message: 'result_error'), code: '404');
        case 401:
        case 301:
        case 302:
          tokenExpired();
          break;
      }
    }
  }

  _getHeader() {
    String? token = AppStorage.preferences.getString(PreferencesKeys.accessToken.name);
    var httpHeaders = {
      'Accept': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };
    if (headers != null) {
      httpHeaders.addAll(headers!);
    }

    return httpHeaders;
  }

  void tokenExpired() async {
    //todo handle 401 exceptions
  }

  Future<T> _getData<T>({
    required ReturnType returnType,
    required String endPoint,
    Function(dynamic data)? dataKeyFun,
    bool refresh = true,
    AppCenterEventEnumBase? appCenterEventName,
    Map<String, String>? headers,
    Function(dynamic data)? toJsonFunc,
  }) async {
    final data = await get(url: endPoint, appCenterEvent: appCenterEventName);
    return _returnDataFromType<T>(data, returnType, toJsonFunc ?? (val) {}, dataKeyFun);
  }

  Future<T> _postData<T>({
    required ReturnType returnType,
    required String endPoint,
    Function(dynamic data)? dataKeyFun,
    Map<String, dynamic> json = const {},
    bool? showLoader,
    Map<String, String>? headers,
    Function(dynamic data)? toJsonFunc,
  }) async {
    var data = await post(url: endPoint, body: json, showLoader: showLoader ?? true);
    return _returnDataFromType<T>(data, returnType, toJsonFunc ?? (val) {}, dataKeyFun);
  }

  Future<T> _putData<T>({
    required ReturnType returnType,
    required String endPoint,
    Function(dynamic data)? dataKeyFun,
    Map<String, dynamic> json = const {},
    bool? showLoader,
    Function(dynamic data)? toJsonFunc,
  }) async {
    final data = await put(url: endPoint, body: json, showLoader: showLoader ?? true);
    return _returnDataFromType<T>(data, returnType, toJsonFunc ?? (val) {}, dataKeyFun);
  }

  Future<T> _patchData<T>({
    required ReturnType returnType,
    required String endPoint,
    Function(dynamic data)? dataKeyFun,
    Map<String, dynamic> json = const {},
    bool? showLoader,
    Function(dynamic data)? toJsonFunc,
  }) async {
    final data = await patch(url: endPoint, body: json, showLoader: showLoader ?? true);
    return _returnDataFromType<T>(data, returnType, toJsonFunc ?? (val) {}, dataKeyFun);
  }

  Future<T> _deleteData<T>({
    required ReturnType returnType,
    required String name,
    Function(dynamic data)? dataKeyFun,
    Map<String, dynamic> json = const {},
    bool? showLoader,
    Function(dynamic data)? toJsonFunc,
  }) async {
    final data = await delete(url: name, body: json, showLoader: showLoader ?? true);
    return _returnDataFromType<T>(data, returnType, toJsonFunc ?? (val) => val, dataKeyFun);
  }

  T _returnDataFromType<T>(
    dynamic data,
    ReturnType returnType,
    Function(dynamic data) toJsonFunc,
    Function(dynamic data)? dataKeyFun,
  ) {
    switch (returnType) {
      case ReturnType.Type:
        return dataKeyFun == null ? data : Function.apply(dataKeyFun, [data]) as T;
      case ReturnType.Model:
        return Function.apply(toJsonFunc, [
          dataKeyFun == null ? data : Function.apply(dataKeyFun, [data])
        ]) as T;

      case ReturnType.List:
        final list = data.map((e) => toJsonFunc(e)).toList() as T;
        return list;
    }
  }

  DioCacheManager _getCacheManager(String baseUrl) {
    _manager = DioCacheManager(CacheConfig(baseUrl: baseUrl, defaultRequestMethod: 'POST'));
    return _manager;
  }

  Options _buildCacheOptions() {
    return buildCacheOptions(
      const Duration(days: 3),
      maxStale: const Duration(days: 7),
      forceRefresh: true,
      options: Options(extra: {}, responseType: _responseType),
    );
  }
}
