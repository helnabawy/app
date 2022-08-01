import 'package:json_annotation/json_annotation.dart';

part 'user.model.g.dart';

@JsonSerializable()
class UserModel {
  @JsonKey(name: 'user_id')
  String id;
  @JsonKey(name: 'given_name')
  String givenName;
  String age;
  String gender;
  @JsonKey(name: 'nationality_name')
  String nationalityName;
  String nationalityId;
  String dob;
  @JsonKey(name: 'birthdate')
  String birthDateHijri;
  String? name;
  @JsonKey(name: 'sub')
  String? socialId;

  UserModel(
      {required this.id,
      required this.age,
      required this.birthDateHijri,
      required this.dob,
      required this.gender,
      required this.givenName,
      required this.nationalityId,
      required this.nationalityName,
      this.socialId,
      this.name});

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
