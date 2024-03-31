import 'package:json_annotation/json_annotation.dart';

part 'location_rm.g.dart';

@JsonSerializable(createToJson: false)
class LocationRM {
  final String type;
  final List<double> coordinates;
  final String formattedAddress;
  final String street;
  final String city;
  final String zipcode;
  final String country;

  LocationRM({
    required this.type,
    required this.coordinates,
    required this.formattedAddress,
    required this.street,
    required this.city,
    required this.zipcode,
    required this.country,
  });

  factory LocationRM.fromJson(Map<String, dynamic> json) =>
      _$LocationRMFromJson(json);
}
