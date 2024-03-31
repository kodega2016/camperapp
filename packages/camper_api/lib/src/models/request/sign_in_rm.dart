import 'package:json_annotation/json_annotation.dart';

part 'sign_in_rm.g.dart';

@JsonSerializable(createFactory: false, explicitToJson: true)
class SignInRM {
  final String email;
  final String password;

  SignInRM({required this.email, required this.password});

  Map<String, dynamic> toJson() => _$SignInRMToJson(this);
}
