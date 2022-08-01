import 'package:json_annotation/json_annotation.dart';

part 'privacy_and_terms_model.g.dart';

@JsonSerializable()
class PrivacyAndTermsModel {
  String privacyPolicy;
  String termsAndConditions;
  PrivacyAndTermsModel(
      {required this.privacyPolicy, required this.termsAndConditions});
  factory PrivacyAndTermsModel.fromJson(Map<String, dynamic> json) =>
      _$PrivacyAndTermsModelFromJson(json);

  Map<String, dynamic> toJson() => _$PrivacyAndTermsModelToJson(this);
}
