import 'package:json_annotation/json_annotation.dart';
part 'faq_category.g.dart';

@JsonSerializable()
class FAQCategory {
  String id;
  String name;
  bool isSelected;
  int numberOfQuestions;
  FAQCategory(
      {required this.id,
      required this.name,
      required this.numberOfQuestions,
      this.isSelected = false});
  factory FAQCategory.fromJson(Map<String, dynamic> json) =>
      _$FAQCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$FAQCategoryToJson(this);
}
