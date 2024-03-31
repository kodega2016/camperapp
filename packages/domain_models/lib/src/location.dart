import 'package:equatable/equatable.dart';

class Location extends Equatable {
  final List<double> coordinates;
  final String formattedAddress;
  final String street;
  final String city;
  final String zipcode;
  final String country;

  Location({
    required this.coordinates,
    required this.formattedAddress,
    required this.street,
    required this.city,
    required this.zipcode,
    required this.country,
  });

  @override
  List<Object?> get props => [
        coordinates,
        formattedAddress,
        street,
        city,
        zipcode,
        country,
      ];
}
