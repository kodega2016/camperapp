// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bootcamp_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BootcampRM _$BootcampRMFromJson(Map<String, dynamic> json) => BootcampRM(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      website: json['website'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String,
      createdAt: json['createdAt'] as String,
      slug: json['slug'] as String,
      photo: json['photo'] as String,
      housing: json['housing'] as bool,
      jobAssistance: json['jobAssistance'] as bool,
      jobGuarantee: json['jobGuarantee'] as bool,
      acceptGi: json['acceptGi'] as bool,
      careers:
          (json['careers'] as List<dynamic>).map((e) => e as String).toList(),
      location: json['location'] as Map<String, dynamic>,
    );
