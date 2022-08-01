// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['user_id'] as String,
      age: json['age'] as String,
      birthDateHijri: json['birthdate'] as String,
      dob: json['dob'] as String,
      gender: json['gender'] as String,
      givenName: json['given_name'] as String,
      nationalityId: json['nationalityId'] as String,
      nationalityName: json['nationality_name'] as String,
      socialId: json['sub'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'user_id': instance.id,
      'given_name': instance.givenName,
      'age': instance.age,
      'gender': instance.gender,
      'nationality_name': instance.nationalityName,
      'nationalityId': instance.nationalityId,
      'dob': instance.dob,
      'birthdate': instance.birthDateHijri,
      'name': instance.name,
      'sub': instance.socialId,
    };
