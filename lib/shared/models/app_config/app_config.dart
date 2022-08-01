import 'package:json_annotation/json_annotation.dart';
import 'application_options.dart';
import 'micro_app_options.dart';
import 'proxy_options.dart';
import 'sso_option.dart';

part 'app_config.g.dart';

@JsonSerializable()
class AppConfig {
  @JsonKey(name: 'MicroAppsOptions')
  MicroAppsOptions microAppsOptions;
  @JsonKey(name: 'SSOOptions')
  SSOOptions sSOOptions;
  @JsonKey(name: 'ProxyOptions')
  ProxyOptions proxyOptions;
  @JsonKey(name: 'ApplicationOptions')
  ApplicationOptions applicationOptions;

  AppConfig({required this.microAppsOptions, required this.sSOOptions, required this.proxyOptions, required this.applicationOptions});

  factory AppConfig.fromJson(Map<String, dynamic> json) => _$AppConfigFromJson(json);
  Map<String, dynamic> toJson() => _$AppConfigToJson(this);
}
