// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'features.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Features _$FeaturesFromJson(Map<String, dynamic> json) => Features(
      biometric: json['Biometric'] as bool?,
      pushNotification: json['PushNotification'] as bool?,
      theming: json['Theming'] as bool?,
    );

Map<String, dynamic> _$FeaturesToJson(Features instance) => <String, dynamic>{
      'Biometric': instance.biometric,
      'PushNotification': instance.pushNotification,
      'Theming': instance.theming,
    };
