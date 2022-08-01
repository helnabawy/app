// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faq_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FAQModel _$FAQModelFromJson(Map<String, dynamic> json) => FAQModel(
      id: json['id'] as String,
      question: json['question'] as String,
      answer: json['answer'] as String,
      isSelected: json['isSelected'] as bool? ?? false,
      categoryId: json['categoryId'] as List<dynamic>,
    );

Map<String, dynamic> _$FAQModelToJson(FAQModel instance) => <String, dynamic>{
      'id': instance.id,
      'categoryId': instance.categoryId,
      'question': instance.question,
      'answer': instance.answer,
      'isSelected': instance.isSelected,
    };
