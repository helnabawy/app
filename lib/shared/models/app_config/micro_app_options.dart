import 'package:json_annotation/json_annotation.dart';

part 'micro_app_options.g.dart';

@JsonSerializable()
class MicroAppsOptions {
  @JsonKey(name: 'BaseUrl')
  String baseUrl;
  @JsonKey(name: 'ApplicationInsightsKey')
  String? applicationInsightsKey;
  @JsonKey(name: 'SiteKey')
  String? siteKey;

  MicroAppsOptions({required this.baseUrl, required this.applicationInsightsKey, required this.siteKey});

  factory MicroAppsOptions.fromJson(Map<String, dynamic> json) =>
      _$MicroAppsOptionsFromJson(json);
  Map<String, dynamic> toJson() => _$MicroAppsOptionsToJson(this);
}
