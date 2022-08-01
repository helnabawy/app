// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generate_otp_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenerateOtpResponse _$GenerateOtpResponseFromJson(Map<String, dynamic> json) =>
    GenerateOtpResponse(
      errorMessage: json['errorMessage'] as String?,
      expiresAt: json['expiresAt'] as String,
      isSuccessful: json['isSuccessful'] as bool,
      token: json['token'] as String,
    );

Map<String, dynamic> _$GenerateOtpResponseToJson(
        GenerateOtpResponse instance) =>
    <String, dynamic>{
      'token': instance.token,
      'expiresAt': instance.expiresAt,
      'isSuccessful': instance.isSuccessful,
      'errorMessage': instance.errorMessage,
    };
