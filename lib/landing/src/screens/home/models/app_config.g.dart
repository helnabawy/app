// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppConfig _$AppConfigFromJson(Map<String, dynamic> json) => AppConfig(
      applicationInsightsKey: json['ApplicationInsightsKey'] as String?,
      clientId: json['ClientId'] as String?,
      mojChatUrl: json['MojChatUrl'] as String?,
      ssoUrl: json['SSOUrl'] as String?,
      secret: json['Secret'] as String?,
      appVersion: json['Version'] == null
          ? null
          : AppVersion.fromJson(json['Version'] as Map<String, dynamic>),
      siteKey: json['SiteKey'] as String?,
      baseUrl: json['baseUrl'] as String?,
      inReview: json['InReview'] as bool?,
      forceUpdate: json['ForceUpdate'] as bool?,
      proxyBaseUrl: json['ProxyBaseUrl'] as String?,
    );

Map<String, dynamic> _$AppConfigToJson(AppConfig instance) => <String, dynamic>{
      'baseUrl': instance.baseUrl,
      'SSOUrl': instance.ssoUrl,
      'Version': instance.appVersion,
      'ApplicationInsightsKey': instance.applicationInsightsKey,
      'ClientId': instance.clientId,
      'Secret': instance.secret,
      'SiteKey': instance.siteKey,
      'MojChatUrl': instance.mojChatUrl,
      'InReview': instance.inReview,
      'ForceUpdate': instance.forceUpdate,
      'ProxyBaseUrl': instance.proxyBaseUrl,
    };
