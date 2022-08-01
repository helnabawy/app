import 'package:json_annotation/json_annotation.dart';
import 'app_version.dart';
import 'features.dart';

part 'application_options.g.dart';

@JsonSerializable()
class ApplicationOptions {
  @JsonKey(name: 'InReview')
  bool inReview;
  @JsonKey(name: 'ForceUpdate')
  bool forceUpdate;
  @JsonKey(name: 'ChatUrl')
  String chatUrl;
  @JsonKey(name: 'AppVersion')
  AppVersion appVersion;
  @JsonKey(name: 'Features')
  Features? features;

  ApplicationOptions({required this.inReview, required this.forceUpdate, required this.chatUrl, required this.appVersion, required this.features});

  factory ApplicationOptions.fromJson(Map<String, dynamic> json) => _$ApplicationOptionsFromJson(json);
  Map<String, dynamic> toJson() => _$ApplicationOptionsToJson(this);
}
