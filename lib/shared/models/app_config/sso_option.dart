import 'package:json_annotation/json_annotation.dart';

part 'sso_option.g.dart';

@JsonSerializable()
class SSOOptions {
  @JsonKey(name: 'BaseUrl')
  String baseUrl;
  @JsonKey(name: 'ClientId')
  String clientId;
  @JsonKey(name: 'Secret')
  String secret;

  SSOOptions({required this.baseUrl, required this.clientId, required this.secret});

  factory SSOOptions.fromJson(Map<String, dynamic> json) => _$SSOOptionsFromJson(json);
  Map<String, dynamic> toJson() => _$SSOOptionsToJson(this);
}
