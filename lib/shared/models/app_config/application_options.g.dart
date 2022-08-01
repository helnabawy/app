// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application_options.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApplicationOptions _$ApplicationOptionsFromJson(Map<String, dynamic> json) =>
    ApplicationOptions(
      inReview: json['InReview'] as bool,
      forceUpdate: json['ForceUpdate'] as bool,
      chatUrl: json['ChatUrl'] as String,
      appVersion:
          AppVersion.fromJson(json['AppVersion'] as Map<String, dynamic>),
      features: json['Features'] == null
          ? null
          : Features.fromJson(json['Features'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApplicationOptionsToJson(ApplicationOptions instance) =>
    <String, dynamic>{
      'InReview': instance.inReview,
      'ForceUpdate': instance.forceUpdate,
      'ChatUrl': instance.chatUrl,
      'AppVersion': instance.appVersion,
      'Features': instance.features,
    };
