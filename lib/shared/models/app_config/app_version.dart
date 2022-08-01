import 'package:json_annotation/json_annotation.dart';

part 'app_version.g.dart';

@JsonSerializable()
class AppVersion {
  @JsonKey(name: 'IOS')
  String iOS;
  @JsonKey(name: 'Android')
  String android;

  AppVersion({required this.iOS, required this.android});

  factory AppVersion.fromJson(Map<String, dynamic> json) => _$AppVersionFromJson(json);
  Map<String, dynamic> toJson() => _$AppVersionToJson(this);
}
