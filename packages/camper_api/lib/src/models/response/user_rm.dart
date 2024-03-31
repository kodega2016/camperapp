// ignore_for_file: invalid_annotation_target

import 'package:json_annotation/json_annotation.dart';

part 'user_rm.g.dart';

@JsonSerializable(createToJson: false)
class UserRM {
  final String role;
  @JsonKey(name: "_id") final String id;
  final String name;
  final String email;
  final String createdAt;

  UserRM({
    required this.role,
    required this.id,
    required this.name,
    required this.email,
    required this.createdAt,
  });

  factory UserRM.fromJson(Map<String, dynamic> json) => _$UserRMFromJson(json);
}
