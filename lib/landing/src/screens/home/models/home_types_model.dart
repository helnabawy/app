import 'package:json_annotation/json_annotation.dart';
import 'package:qcb/landing/src/screens/home/models/menu_item_model.dart';
part 'home_types_model.g.dart';

@JsonSerializable()
class MenuTypesModel {
  List<MenuItemModel>? mainMenu;
  List<MenuItemModel>? verificationMenu;
  List<MenuItemModel>? supportMenu;
  MenuTypesModel({this.mainMenu, this.supportMenu, this.verificationMenu});
  factory MenuTypesModel.fromJson(Map<String, dynamic> json) => _$MenuTypesModelFromJson(json);

  Map<String, dynamic> toJson() => _$MenuTypesModelToJson(this);
}
