import 'package:json_annotation/json_annotation.dart';
part 'faq_model.g.dart';

@JsonSerializable()
class FAQModel {
  String id;
  List<dynamic> categoryId;
  String question;
  String answer;
  bool isSelected;
  FAQModel(
      {required this.id,
      required this.question,
      required this.answer,
      this.isSelected = false,
      required this.categoryId});
  factory FAQModel.fromJson(Map<String, dynamic> json) =>
      _$FAQModelFromJson(json);

  Map<String, dynamic> toJson() => _$FAQModelToJson(this);
}
