// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ionic_micro_app.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IonicMicroApp _$IonicMicroAppFromJson(Map<String, dynamic> json) =>
    IonicMicroApp(
      name: json['name'] as String,
      title: json['title'] as String,
      url: json['url'] as String,
      version: json['version'] as String,
      isDownloaded: json['isDownloaded'] as bool? ?? false,
      additionalData: json['additionalData'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$IonicMicroAppToJson(IonicMicroApp instance) =>
    <String, dynamic>{
      'name': instance.name,
      'title': instance.title,
      'url': instance.url,
      'version': instance.version,
      'isDownloaded': instance.isDownloaded,
      'additionalData': instance.additionalData,
    };
