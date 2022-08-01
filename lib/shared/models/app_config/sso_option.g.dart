// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sso_option.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SSOOptions _$SSOOptionsFromJson(Map<String, dynamic> json) => SSOOptions(
      baseUrl: json['BaseUrl'] as String,
      clientId: json['ClientId'] as String,
      secret: json['Secret'] as String,
    );

Map<String, dynamic> _$SSOOptionsToJson(SSOOptions instance) =>
    <String, dynamic>{
      'BaseUrl': instance.baseUrl,
      'ClientId': instance.clientId,
      'Secret': instance.secret,
    };
