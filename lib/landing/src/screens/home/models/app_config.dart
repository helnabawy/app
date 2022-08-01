import 'package:json_annotation/json_annotation.dart';

import 'app_version.dart';

part 'app_config.g.dart';

@JsonSerializable()
class AppConfig {
  String? baseUrl;
  @JsonKey(name: 'SSOUrl')
  String? ssoUrl;
  @JsonKey(name: 'Version')
  AppVersion? appVersion;
  @JsonKey(name: 'ApplicationInsightsKey')
  String? applicationInsightsKey;
  @JsonKey(name: 'ClientId')
  String? clientId;
  @JsonKey(name: 'Secret')
  String? secret;
  @JsonKey(name: 'SiteKey')
  String? siteKey;
  @JsonKey(name: 'MojChatUrl')
  String? mojChatUrl;
  @JsonKey(name: 'InReview')
  bool? inReview;
  @JsonKey(name: 'ForceUpdate')
  bool? forceUpdate;
  @JsonKey(name: 'ProxyBaseUrl')
  String? proxyBaseUrl;

  AppConfig(
      {this.applicationInsightsKey,
      this.clientId,
      this.mojChatUrl,
      this.ssoUrl,
      this.secret,
      this.appVersion,
      this.siteKey,
      this.baseUrl,
      this.inReview,
      this.forceUpdate,
      this.proxyBaseUrl});
  factory AppConfig.fromJson(Map<String, dynamic> json) =>
      _$AppConfigFromJson(json);

  Map<String, dynamic> toJson() => _$AppConfigToJson(this);
}
