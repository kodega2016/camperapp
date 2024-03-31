// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationRM _$LocationRMFromJson(Map<String, dynamic> json) => LocationRM(
      type: json['type'] as String,
      coordinates: (json['coordinates'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      formattedAddress: json['formattedAddress'] as String,
      street: json['street'] as String,
      city: json['city'] as String,
      zipcode: json['zipcode'] as String,
      country: json['country'] as String,
    );
