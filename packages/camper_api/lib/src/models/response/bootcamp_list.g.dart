// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bootcamp_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BootcampList _$BootcampListFromJson(Map<String, dynamic> json) => BootcampList(
      bootcamps: (json['data'] as List<dynamic>)
          .map((e) => BootcampRM.fromJson(e as Map<String, dynamic>))
          .toList(),
      count: json['count'] as int,
    );
