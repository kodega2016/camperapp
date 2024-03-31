import 'package:domain_models/src/location.dart';
import 'package:equatable/equatable.dart';

class Bootcamp extends Equatable {
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
  final Location location;

  Bootcamp({
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
    required this.location,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        website,
        phone,
        email,
        createdAt,
        slug,
        photo,
        housing,
        jobAssistance,
        jobGuarantee,
        acceptGi,
        careers,
        location,
      ];
}
