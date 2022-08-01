import 'http_client_handler.dart';

abstract class NetworkHandler {
  final HttpClientHandler httpClient;

  NetworkHandler(this.httpClient);
}
