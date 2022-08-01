// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faq_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FAQCategory _$FAQCategoryFromJson(Map<String, dynamic> json) => FAQCategory(
      id: json['id'] as String,
      name: json['name'] as String,
      numberOfQuestions: json['numberOfQuestions'] as int,
      isSelected: json['isSelected'] as bool? ?? false,
    );

Map<String, dynamic> _$FAQCategoryToJson(FAQCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'isSelected': instance.isSelected,
      'numberOfQuestions': instance.numberOfQuestions,
    };
