part of 'network.imports.dart';

class Network implements NetworkHandler {
  Network._();
  static final Network _instance = Network._();
  factory Network() => _instance;

  late final HttpClientHandler _httpClient;
  @override
  HttpClientHandler get httpClient => _httpClient;

  late final String _baseUrl;
  String get baseUrl => _baseUrl;

  init({required BuildContext context, required HttpClientHandler httpClient}) {
    try {
      _baseUrl = _getBaseUrl();
      _httpClient = httpClient
        ..setBaseUrl(_baseUrl)
        ..setContext(context);
    } catch (_) {}
  }

  String _getBaseUrl() {
    return AppConfigService.getproxyUrl();
  }
}
