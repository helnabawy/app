// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'privacy_and_terms_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrivacyAndTermsModel _$PrivacyAndTermsModelFromJson(
        Map<String, dynamic> json) =>
    PrivacyAndTermsModel(
      privacyPolicy: json['privacyPolicy'] as String,
      termsAndConditions: json['termsAndConditions'] as String,
    );

Map<String, dynamic> _$PrivacyAndTermsModelToJson(
        PrivacyAndTermsModel instance) =>
    <String, dynamic>{
      'privacyPolicy': instance.privacyPolicy,
      'termsAndConditions': instance.termsAndConditions,
    };
