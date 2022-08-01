import 'package:json_annotation/json_annotation.dart';
part 'ionic_micro_app.g.dart';

@JsonSerializable()
class IonicMicroApp {
  String name;
  String title;
  String url;
  String version;
  bool? isDownloaded;
  Map<String, dynamic>? additionalData;

  IonicMicroApp(
      {required this.name,
      required this.title,
      required this.url,
      required this.version,
      this.isDownloaded = false,
      this.additionalData});

  String get directoryName => '/${name}_$version';

  factory IonicMicroApp.fromJson(Map<String, dynamic> json) => _$IonicMicroAppFromJson(json);

  Map<String, dynamic> toJson() => _$IonicMicroAppToJson(this);
}
