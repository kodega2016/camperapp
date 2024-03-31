import 'package:json_annotation/json_annotation.dart';

part 'bootcamp_rm.g.dart';

@JsonSerializable(createToJson: false)
class BootcampRM {
  final String id;
  final String name;
  final String description;
  final String website;
  final String phone;
  final String email;
  final String createdAt;
  final String slug;
  final String photo;
  final bool housing;
  final bool jobAssistance;
  final bool jobGuarantee;
  final bool acceptGi;
  final List<String> careers;
  // final List<String> courses;
  final Map<String, dynamic> location;

  BootcampRM({
    required this.id,
    required this.name,
    required this.description,
    required this.website,
    required this.phone,
    required this.email,
    required this.createdAt,
    required this.slug,
    required this.photo,
    required this.housing,
    required this.jobAssistance,
    required this.jobGuarantee,
    required this.acceptGi,
    required this.careers,
    // required this.courses,
    required this.location,
  });

  factory BootcampRM.fromJson(Map<String, dynamic> json) =>
      _$BootcampRMFromJson(json);
}
