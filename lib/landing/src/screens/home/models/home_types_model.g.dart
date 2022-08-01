// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_types_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MenuTypesModel _$MenuTypesModelFromJson(Map<String, dynamic> json) =>
    MenuTypesModel(
      mainMenu: (json['mainMenu'] as List<dynamic>?)
          ?.map((e) => MenuItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      supportMenu: (json['supportMenu'] as List<dynamic>?)
          ?.map((e) => MenuItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      verificationMenu: (json['verificationMenu'] as List<dynamic>?)
          ?.map((e) => MenuItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MenuTypesModelToJson(MenuTypesModel instance) =>
    <String, dynamic>{
      'mainMenu': instance.mainMenu,
      'verificationMenu': instance.verificationMenu,
      'supportMenu': instance.supportMenu,
    };
