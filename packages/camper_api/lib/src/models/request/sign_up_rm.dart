import 'package:json_annotation/json_annotation.dart';

part 'sign_up_rm.g.dart';

@JsonSerializable(createFactory: false)
class SignUpRM {
  final String name;
  final String email;
  final String password;

  SignUpRM({required this.name, required this.email, required this.password});

  Map<String, dynamic> toJson() => _$SignUpRMToJson(this);
}
