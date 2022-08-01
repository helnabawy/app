import 'package:json_annotation/json_annotation.dart';

part 'features.g.dart';

@JsonSerializable()
class Features {
  @JsonKey(name: 'Biometric')
  bool? biometric;
  @JsonKey(name: 'PushNotification')
  bool? pushNotification;
  @JsonKey(name: 'Theming')
  bool? theming;

  Features({required this.biometric, required this.pushNotification, required this.theming});

  factory Features.fromJson(Map<String, dynamic> json) => _$FeaturesFromJson(json);
  Map<String, dynamic> toJson() => _$FeaturesToJson(this);
}
