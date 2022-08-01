import 'package:json_annotation/json_annotation.dart';
part 'menu_item_model.g.dart';

@JsonSerializable()
class MenuItemModel {
  String? appName;
  String title;
  String? description;
  String? route;
  String? icon;
  bool? showInHomePage;
  bool? isOrganizationActivation;
  bool? haveSubMenu;
  List<MenuItemModel>? subMenu;
  MenuItemModel(
      {this.appName,
      required this.title,
      this.description,
      this.haveSubMenu,
      this.icon,
      this.isOrganizationActivation,
      this.route,
      this.showInHomePage,
      this.subMenu});

  String get routeName {
    final hasRoute = route != null && route!.isNotEmpty;
    return '$appName${hasRoute ? '#$route' : ''}';
  }

  factory MenuItemModel.fromJson(Map<String, dynamic> json) => _$MenuItemModelFromJson(json);
  Map<String, dynamic> toJson() => _$MenuItemModelToJson(this);
}
