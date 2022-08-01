import 'package:json_annotation/json_annotation.dart';

part 'lookup_model.g.dart';

@JsonSerializable()
class Lookup {
  const Lookup({this.name, this.id});

  final int? id;
  final String? name;

  factory Lookup.fromJson(Map<String, dynamic> json) => _$LookupFromJson(json);

  Map<String, dynamic> toJson() => _$LookupToJson(this);
}
