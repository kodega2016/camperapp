import 'package:camper_api/camper_api.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bootcamp_list.g.dart';

@JsonSerializable(createToJson: false)
class BootcampList {
  @JsonKey(name: "data")
  final List<BootcampRM> bootcamps;
  final int count;

  BootcampList({
    required this.bootcamps,
    required this.count,
  });

  factory BootcampList.fromJson(Map<String, dynamic> json) =>
      _$BootcampListFromJson(json);
}
