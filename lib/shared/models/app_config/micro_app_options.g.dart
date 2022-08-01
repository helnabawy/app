// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'micro_app_options.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MicroAppsOptions _$MicroAppsOptionsFromJson(Map<String, dynamic> json) =>
    MicroAppsOptions(
      baseUrl: json['BaseUrl'] as String,
      applicationInsightsKey: json['ApplicationInsightsKey'] as String?,
      siteKey: json['SiteKey'] as String?,
    );

Map<String, dynamic> _$MicroAppsOptionsToJson(MicroAppsOptions instance) =>
    <String, dynamic>{
      'BaseUrl': instance.baseUrl,
      'ApplicationInsightsKey': instance.applicationInsightsKey,
      'SiteKey': instance.siteKey,
    };
