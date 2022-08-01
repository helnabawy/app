import 'package:json_annotation/json_annotation.dart';

part 'proxy_options.g.dart';

@JsonSerializable()
class ProxyOptions {
  @JsonKey(name: 'BaseUrl')
  String baseUrl;

  ProxyOptions({required this.baseUrl});

  factory ProxyOptions.fromJson(Map<String, dynamic> json) => _$ProxyOptionsFromJson(json);
  Map<String, dynamic> toJson() => _$ProxyOptionsToJson(this);
}
