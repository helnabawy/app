// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppConfig _$AppConfigFromJson(Map<String, dynamic> json) => AppConfig(
      microAppsOptions: MicroAppsOptions.fromJson(
          json['MicroAppsOptions'] as Map<String, dynamic>),
      sSOOptions:
          SSOOptions.fromJson(json['SSOOptions'] as Map<String, dynamic>),
      proxyOptions:
          ProxyOptions.fromJson(json['ProxyOptions'] as Map<String, dynamic>),
      applicationOptions: ApplicationOptions.fromJson(
          json['ApplicationOptions'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AppConfigToJson(AppConfig instance) => <String, dynamic>{
      'MicroAppsOptions': instance.microAppsOptions,
      'SSOOptions': instance.sSOOptions,
      'ProxyOptions': instance.proxyOptions,
      'ApplicationOptions': instance.applicationOptions,
    };
