// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MenuItemModel _$MenuItemModelFromJson(Map<String, dynamic> json) =>
    MenuItemModel(
      appName: json['appName'] as String?,
      title: json['title'] as String,
      description: json['description'] as String?,
      haveSubMenu: json['haveSubMenu'] as bool?,
      icon: json['icon'] as String?,
      isOrganizationActivation: json['isOrganizationActivation'] as bool?,
      route: json['route'] as String?,
      showInHomePage: json['showInHomePage'] as bool?,
      subMenu: (json['subMenu'] as List<dynamic>?)
          ?.map((e) => MenuItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MenuItemModelToJson(MenuItemModel instance) =>
    <String, dynamic>{
      'appName': instance.appName,
      'title': instance.title,
      'description': instance.description,
      'route': instance.route,
      'icon': instance.icon,
      'showInHomePage': instance.showInHomePage,
      'isOrganizationActivation': instance.isOrganizationActivation,
      'haveSubMenu': instance.haveSubMenu,
      'subMenu': instance.subMenu,
    };
