import 'package:json_annotation/json_annotation.dart';

part 'generate_otp_response.g.dart';

@JsonSerializable()
class GenerateOtpResponse {
  String token;
  String expiresAt;
  bool isSuccessful;
  String? errorMessage;
  GenerateOtpResponse({this.errorMessage, required this.expiresAt, required this.isSuccessful, required this.token});

  factory GenerateOtpResponse.fromJson(Map<String, dynamic> json) => _$GenerateOtpResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GenerateOtpResponseToJson(this);
}
